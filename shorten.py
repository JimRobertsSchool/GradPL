#!/usr/bin/python
import pp

#The prefix for temporary functions
prefix = "__pp_"

"""
The generated function prologue 
Ended up just being a label
I tried originally to create a static variable to store
the return address but it ended up being too many
lines of extra code to be worth it
"""
pp_begining = [
        #"pushl   %eax",
        #"movl    8(%esp), %eax",
        #"movl    %eax, " + "%s" % (pp.return_name),
        #"popl    %eax",
        #"addl    $4, %esp"
        ]

"""
The generated function epilogue
Ended up just being a ret instruction
same reminants from above
"""
pp_end = [
        #"subl    $4, %esp",
        #"pushl   %eax",
        #"movl    %s" % (pp.return_name) + ", %eax",
        #"movl    %eax, 8(%esp)",
        #"popl    %eax",
        "ret"
        ]

#List of instructions/symbols to avoid in abstracted segments
avoids = [":",
          "jo",
	  "js",
	  "je",
	  "jz",
	  "jb",
	  "jc",
	  "ja",
	  "jl",
	  "jg",
	  "jp",
	  "jno",
	  "jne",
	  "jnz",
	  "jnb",
	  "jae",
	  "jnc",
	  "jbe",
	  "jna",
	  "jge",
	  "jnl",
	  "jle",
	  "jng",
	  "jpe",
	  "jnp",
	  "jpo",
	  "pop",
	  "ret",
	  "esp",
	  "rsp",
	  "jnae",
	  "jnbe",
	  "jnge",
	  "jnle",
	  "jcxz",
	  "call",
	  "push",
	  "jecxz"
	  ]

class SuffixNode:
    def __init__(self, depth = 0):
        self.children = dict()
        self.value = None
        self.parent = None
        self.depth = depth
        self.locations = list()

    def count_children(self):
        if self.value is None:
            return 0
        added_branches = len(self.children.values()) - 1
        for v in self.children.values():
            added_branches += v.count_children()
        return added_branches

    def get_value(self):
	c = self.count_children()
	d = self.depth
	#return c*(d-1)-(d+2)
        return (d ** 1) * (c ** 1)

    def insert(self, remaining_list, index, parent = None):
        if not len(remaining_list) > 0:
            return

        self.locations += [index]
        self.value = remaining_list[0]
        rest = remaining_list[1:]

        #print "node " + str(self.value) + " adding " + str(rest)

        if self.value in self.children:
            child = self.children[self.value]
        else:
            child = SuffixNode(self.depth + 1)
            child.parent = self
            if parent is not None:
                parent.nodes.append(child)
            self.children[self.value] = child

        child.insert(rest, index, parent)

    def find(self, remaining_list):
        if not len(remaining_list) > 0:
            return self.locations
        
        current = remaining_list[0]
        rest = remaining_list[1:]

        if current in self.children:
            return self.children[current].find(rest)

        return None

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        if self.value is None:
            return ""
        to_print = self.depth * " " + str(self.value)
        to_print += "\n".join(str(e) for e in self.children.values())
        return to_print

    def printer(self, prefix=""):
        if self.value is None or list_in_string(avoids, self.value):
            #print prefix + " " + str(self.get_value())
            return
        else:
            if self.get_value() > 0:
                print "***" + prefix + "\n**" + str(self.get_value()) + "\n"
            for k, v in self.children.items():
                v.printer(prefix+"\n"+str(k)) 


class SuffixTree:
    def __init__(self, source):
        """
        self.best_val = 0
        self.to_return = None
        """
        if len(str(source[-1])) != 0:
            source += [""]
        self.root = SuffixNode(0)
        self.nodes = [self.root]
        
        for i in xrange(len(source)):
            #print "adding " + str(source[i:])
            self.root.insert(source[i:], i, self)

        self.root.value = ""

    def get_max(self):
        return max(self.nodes, key=lambda a: a.get_value())

    def tree_max(self):
        def branch(current, code):
            if current.value is None:
                return
            if current.get_value() > branch.best_val and len(code) >= 2:
	        print "%d, %d, %d" % (len(code), current.count_children(), current.depth)
                branch.to_return = code[:]
                branch.best_val = current.get_value()
            for k, v in current.children.items():
                if not list_in_string(avoids, k):
                    branch(v, code + [k])
        branch.best_val = 0
        branch.to_return = []
        branch(self.root, [])
        return branch.to_return
        

def shorten(program):
    start = program.index(pp.signals[0]) + 1
    end = program.index(pp.signals[1])
    my_start = program.index(pp.signals[2]) + 1
    my_end = program.index(pp.signals[3])

    editable = program[start:end]

    st = SuffixTree(editable)
    ##st.root.printer("")
    # Failed attempt to iterate over a list instead of doing it all recursively again
    """
    to_sub = st.get_max()
    new_fun = []
    while to_sub is not None:
        print to_sub.value
        new_fun = [to_sub.value] + new_fun
        to_sub = to_sub.parent
    """
    middle_temp = st.tree_max()
    if len(middle_temp) == 0:
        return program
    new_fun_name = next_temp(program[my_start:my_end])
    new_fun = [new_fun_name + ":"] + pp_begining + middle_temp + pp_end

    i = 0
    while i + len(middle_temp) < len(editable):
        if list_equals(middle_temp, editable[i:i+len(middle_temp)]):
            editable = editable[:i] + ["call    %s" % (new_fun_name)] + editable[i+len(middle_temp):]
        i += 1
    if len(editable[-1]) == 0:
        editable = editable[:-1]
    return program[:start] + editable + program[end:my_start] + new_fun + program[my_start:]

def list_equals(first, second):
    return reduce(lambda a, c: a and c[0] == c[1], zip(first, second), True)

def next_temp(section):
    return prefix + str(reduce(lambda a, c: a + 1 if ":" in str(c) else a, section, 0))

def list_in_string(lis, string):
    for each in lis:
        if each in string:
            return True
    return False

def main():
    lis = list("possessoress")
    #print lis
    #lis.reverse()
    s = SuffixTree(lis)
    #s.root.printer("")
    #print s.root.find(list("bs"))
    print list_in_string(avoids, 'pushq\t%rbp')


if __name__ == "__main__":
    main()
