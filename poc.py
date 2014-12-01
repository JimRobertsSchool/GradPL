class Node:
    def __init__(self, value="", children={}, parent=None):
        self.value = value
        self.children = children
        self.parent = parent

    def insert(self, string_list):
        cur = string_list[0]
        print cur
        rest = string_list[1:]
        self.make_tree(rest, current)



class Tree:
    def __init__(self, string, split=""):
        self.head = Node()
        self.make_tree(clean_list(string, split), self.head)

    def make_tree(self, string_list, current):
        if len(string_list) == 0:
            return


def clean_list(string, split):
    return filter(check_empty, mysplit(string, split))

def mysplit(string, split):
    if split == "":
        return empty_split(string)
    return slow_split(string, split)

def empty_split(string):
    return list(string) + [""]

def slow_split(string, split, i=0):
    if (i > len(string)) or string == "":
        return [string]
    s = len(split)
    """ not neccessary when calling mysplit
    if (s == 0):
        i = 1
    """
    if (string[i:i+s] == split):
        return [string[:i]] + slow_split(string[i+s:], split, 0)
    return slow_split(string, split, i+1)

def check_empty(string):
    if len(string) == 0 or string[0] == "\n":
        return False
    return True

def main():
    #print mysplit("hello", "")
    #print mysplit(";jim;roberts;student;;15", ";")
    Tree("hello")



if __name__ == "__main__":
    main()
