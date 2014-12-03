from sys import argv
from os import stat

o = "orig.s"
p = "pp.s"


def main():
    print argv[1]
    name = argv[1].split(".")

    name[-1] = o
    on = reconstruct(name)
    name[-1] = p
    pn = reconstruct(name)

    ol = numlines(on)
    pl = numlines(pn)

    ob = numbytes(on)
    pb = numbytes(pn)

    with open("result.csv", "a") as f:
        f.write(info(on, ol, ob))
        f.write(info(pn, pl, pb))

def info(name, lines, byte):
    return name + "," + lines + "," + byte + "\n"

def reconstruct(name):
    return ".".join(name)

def numbytes(name):
    return str(stat(name).st_size)

def numlines(name):
    with open(name, "r") as f:
        return str(sum(1 for line in f))

if __name__ == "__main__":
    main()
