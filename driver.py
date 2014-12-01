from __future__ import print_function
from argparse import *
from subprocess import call
import pp
import shorten

modes = {"c":0, "s":1, "p":2}
gcc_args = ["-O0", "-S"]

def main():
	parser = ArgumentParser()
	parser.add_argument("file", help="the file to work on")
	parser.add_argument("-p", "--print", help="output to stdout instead of file", action="store_true")
	parser.add_argument("-v", "--verbose", help="display the reduction percentage of the new file", action="store_true")
	#parser.add_argument("-m", "--mode", help="one of {\"c\", \"s[ource]\", \"p[rocessed]\"} treat the input file as a specific type instead of using file extensions")
	args = parser.parse_args()

	"""
	if args.mode is not None:
		args.mode = get_mode(args.mode)
	"""


	if "." not in args.file:
		print("Error: invalid file name")
		exit()

	file_name = args.file.split(".")

	if file_name[-1] == "c":
		# run gcc
		gcc_call = ["gcc"]+gcc_args+[reconstruct_name(file_name)]
		ret = call(gcc_call)
		# if gcc had an error then exit
		if ret != 0:
			exit()
		file_name[-1] = "s"

	if file_name[-1] == "s":
		#call my preprocessor
		with open(reconstruct_name(file_name), "r") as fin:
			lines = fin.read().splitlines()
			processed = pp.process(lines)
			#print("\n".join(str(e) for e in processed))
			file_name[-1] = "orig"
			#write out the processed lines
			with open(reconstruct_name(file_name), "w") as fout:
				fout.write("\n".join(str(e) for e in processed))

	if file_name[-1] == "orig":
		orig = reconstruct_name(file_name)
		file_name[-1] = "pp"
		new = reconstruct_name(file_name)
		cp_call = ["cp", orig, new]
		ret = call(cp_call)
		if ret != 0:
			exit()

	if file_name[-1] == "pp":
		#run the actual procedural abstraction
		program = None
		with open(reconstruct_name(file_name), "r") as fin:
			program = fin.read().splitlines()
		new_program = shorten.shorten(program)
		with open(reconstruct_name(file_name), "w") as fout:
			fout.write("\n".join(new_program))
		


def reconstruct_name(file_name_list):
	return ".".join(str(e) for e in file_name_list)


if __name__ == "__main__":
	main()
