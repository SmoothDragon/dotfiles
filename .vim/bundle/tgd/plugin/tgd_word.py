#!/usr/bin/env python

import sys
import vim

def Anagram(word):
    letters = word.upper()
    letterList = [ x for x in letters ]
    letterList.sort()
    anagram = ''.join(letterList)
    l = len(letters)+1 # To avoid stripping of the '\n' before comparing

    wordlist = open("/home/tom/share/dict/word.lst",'r').readlines()
    results = []
    for line in wordlist:
        if len(line) != l:
            continue
        line = line.rstrip()
        lineList = [ x for x in line ]
        lineList.sort()
        if letterList == lineList:
            results.append(line) 
    return results

def AnagramCursorWord():
    line = vim.current.line
    (r,c) = vim.current.window.cursor
    print(' '.join(tgd_word.Anagram(CursorWord(line,c))))

def Define(word):
    letters = word.upper()

    wordlist = open("/home/tom/share/dict/word.def",'r').readlines()
    results = []
    for line in wordlist:
        line = line.rstrip()
        lineList = line.split()
        if letters == lineList[0]:
            return line
    return letters + ': **NOT FOUND**'

if __name__ == '__main__':
    import sys
    import doctest      
    doctest.testmod()

