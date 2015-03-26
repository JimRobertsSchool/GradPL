#!/usr/bin/python

"""
James Roberts
GradPL Project
"""

"""
Remnants of attempt to store the return address not
on the stack
"""
return_name = "__jims_var"
holder = [
	#".local %s" % (return_name),
	#".comm %s,4,4" % (return_name)
	]

# Comments tagging the start and end of sections
signals = [
	"#eligible start",
	"#eligible end",
	"#added start",
	"#added end"
	]

# Some compiler directives I wanted to get rid of
avoids = [
	".cfi",
	"cfa"
	]

# Filter and trim source, add tags
def process(source):
	#Filter and trim whitespace
	bit_32 = map(trim, filter(keep, source))
	##print "\n".join(str(e) for e in bit_32)

	# Get indexes for certain locations
	insert = find_partial(bit_32, ".file") + 1
	start = bit_32.index(".text") + 1
	end = find_partial(bit_32, ".ident")

	# Return several joined list slices
	return bit_32[:insert] + holder + bit_32[insert:start] + signals[:1] + bit_32[start:end] + signals[1:] + bit_32[end:]


# Calls string.strip
def trim(line):
	return str(line).strip(None)


# Filter function to check all things to be avoided
def keep(line):
	if len(line) == 0:
		return False
	for each in avoids:
		if each in line:
			return False
	return True

# Looks for substring of a string list
def find_partial(source, look):
	for i, line in enumerate(source):
		if look in line:
			return i
	return -1
