#!/usr/bin/env python
print "picoCTF{%s}" % bin(27)[2:]
#bin(27) is using the bin function to convert 27 to binary, [2:] is slicing off the first 2 indexes from the output
#without it it would be 0b11011 (0b indicates this is a binary number)

