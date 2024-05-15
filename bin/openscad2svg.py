#!/usr/bin/env python3

import sys

filename = sys.argv[1]

with open(filename, 'r') as infile:
    lines = infile.readlines()
lines[-2] = '" stroke="none" fill="black" stroke_width="none" />\n'

# print(lines[-2], end='')
print(''.join(lines))
