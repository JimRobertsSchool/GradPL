#!/usr/bin/python

return_name = "__jims_var"
holder = [
	".local %s" % (return_name),
	".comm %s,4,4" % (return_name)
	]

signals = [
	"#eligible start",
	"#eligible end",
	"#added start",
	"#added end"
	]

avoids = [
	".cfi",
	"cfa"
	]

def process(source):
	bit_32 = map(trim, filter(keep, source))
	#print "\n".join(str(e) for e in bit_32)
	insert = find_partial(bit_32, ".file") + 1
	start = bit_32.index(".text") + 1
	end = find_partial(bit_32, ".ident")

	return bit_32[:insert] + holder + bit_32[insert:start] + signals[:1] + bit_32[start:end] + signals[1:] + bit_32[end:]


def trim(line):
	return str(line).strip(None)


def keep(line):
	if len(line) == 0:
		return False
	for each in avoids:
		if each in line:
			return False
	return True

def find_partial(source, look):
	for i, line in enumerate(source):
		if look in line:
			return i
	return -1
