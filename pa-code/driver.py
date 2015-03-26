from __future__ import print_function
from argparse import *
from subprocess import call
import pp
import shorten
import sys

"""
James Roberts
GradPL Project
"""

#modes = {"c":0, "s":1, "p":2}
gcc_args = ["-O0", "-S"]
gcc_args_o = ["-c"]
gcc_args_out = ["-o"]

def main():
    """
    Add parsing functionality and arguments
    Helpful arguments such as -e to create executables automatically
    And -f to run Stage 4 in a loop automatically
    """
    parser = ArgumentParser()
    parser.add_argument("file", help="the file to work on")
    parser.add_argument("-p", "--print", help="output to stdout instead of file", action="store_true")
    parser.add_argument("-v", "--verbose", help="display the reduction percentage of the new file", action="store_true")
    parser.add_argument("-e", "--execute", help="have the driver generate executables of the original and abstracted sources", action="store_true")
    parser.add_argument("-f", "--final", help="have the driver run to completion instead of just abstracting the first function it finds", action="store_true")
    args = parser.parse_args()

    if "." not in args.file:
        print("Error: invalid file name")
        exit()

    file_name = args.file.split(".")

    # Stage 1
    if file_name[-1] == "c":
        # run gcc
        gcc_call = ["gcc"]+gcc_args+[reconstruct_name(file_name)]
        ret = call(gcc_call)
        # if gcc had an error then exit
        if ret != 0:
            exit()
        file_name[-1] = "s"

    # Stage 2
    if file_name[-1] == "s" and not (file_name[-2] == "orig" or file_name[-2] == "pp"):
        #call my preprocessor
        with open(reconstruct_name(file_name), "r") as fin:
            lines = fin.read().splitlines()
            processed = pp.process(lines)
            #print("\n".join(str(e) for e in processed))
            file_name[-1] = "orig.s"
            file_name = reconstruct_name(file_name).split(".")
            #write out the processed lines
            with open(reconstruct_name(file_name), "w") as fout:
                for c in processed:
                    fout.write(c)
                    fout.write("\n")
        if args.execute:
            make_executable(file_name)


    # Stage 3
    if file_name[-2] == "orig":
        orig = reconstruct_name(file_name)
        file_name[-2] = "pp"
        new = reconstruct_name(file_name)
        cp_call = ["cp", orig, new]
        ret = call(cp_call)
        if ret != 0:
            exit()

    # Stage 4
    if file_name[-2] == "pp":
        cont = True
        while True and cont:
            #run the actual procedural abstraction
            program = None
            with open(reconstruct_name(file_name), "r") as fin:
                program = fin.read().splitlines()
            new_program = shorten.shorten(program)
            if len(new_program) >= len(program):
                if len(new_program) > len(program) or reduce(lambda a, c: a and c[0] == c[1], zip(new_program, program), True):
                    print("No changes made", file=sys.stderr)
                    break
                print("File not shortened", file=sys.stderr)
            if not args.print:
                with open(reconstruct_name(file_name), "w") as fout:
                    for c in new_program:
                        fout.write(c)
                        fout.write("\n")
            else:
                print("\n".join(new_program))
                print()
                cont = False
            if args.verbose:
                print(float(len(new_program))/len(program))
            if not args.final:
                break
        if args.execute:
            make_executable(file_name)


def make_executable(name):
    copy = name[:]
    copy[-1] = "s"
    gcc_call_1 = ["gcc"] + gcc_args_o + [reconstruct_name(copy)]
    ret = call(gcc_call_1)

    if ret != 0:
        exit()

    copy[-1] = "o"
    obj = reconstruct_name(copy)
    copy[-1] = "out"
    exe = reconstruct_name(copy)
    gcc_call_2 = ["gcc"] + gcc_args_out + [exe, obj]
    #ret = call(gcc_call_2)

    if ret != 0:
        exit()

def reconstruct_name(file_name_list):
    return ".".join(str(e) for e in file_name_list)


if __name__ == "__main__":
    main()
