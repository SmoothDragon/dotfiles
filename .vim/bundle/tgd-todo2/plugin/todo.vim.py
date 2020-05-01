#!/usr/bin/env python3

import vim
import datetime
import re
import shutil

format = '%Y-%m-%d'
prefix = 'x'


def getWord(line, pos, sep=' '):
    ''' Get word in *line* containing the *pos* character.
    >>> line = 'The quick brown fox jumped over the lazy dog.'
    >>> a,b = getWord(line, 18); line[a:b]
    'fox'
    >>> a,b = getWord(line, 4); line[a:b]
    'quick'
    >>> a,b = getWord(line, 3); line[a:b]
    ''
    >>> a,b = getWord(line, 41); line[a:b]
    'dog.'
    '''
    try:
        if line[pos] == sep:
            return pos, pos
    except IndexError:
        return pos, pos
    front = line[:pos].rfind(sep) + 1  # correct even when search fails
    back = line[pos+1:].find(sep)
    if back == -1:
        back = len(line)
    else:
        back += pos + 1
    return front, back


def marked(item):
    for mark in ('#', '+', '@', 'due:', 'rec:', 't:'):
        if item[:len(mark)] == mark:
            return True
    return False


def ordinal(i):
    '''Return the ordinal string for a number
    '''
    k = i % 10
    return '%d%s' % (i, 'tsnrhtdd'[(i/10%10!=1)*(k<4)*k::4])

def date_info(date):
    # %U is Sunday based week number, %W is Monday based, %V is ISO 8601
    return date.strftime('Day: %j Week: %U '+ordinal((date.day-1)//7+1)+' %A')

def todo_toggle_completion():
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    Item = line.split()
    if Item[0] != prefix:
        date = datetime.datetime.today()
        line = ' '.join([prefix, date.strftime(format), line])
    else:
        try:
            # If start matches date format, remove it
            date = datetime.datetime.strptime(Item[1], format)
            line = ' '.join(Item[2:])
        except ValueError:
            # Otherwise, just remove the leading 'x ' characters
            line = ' '.join(Item[1:])
    vim.current.buffer[row-1] = line

def todo_clean_line():
    '''Delete all data except +tags and @contexts from line.
    Note this function will overwrite current line.
    '''
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    date = datetime.datetime.today()
    Item = line.split()
    line = date.strftime(format) + ' ' + ' '.join([item for item in Item if marked(item)]) 
    vim.current.buffer[row-1] = line

def todo_new_date_line():
    (row, col) = vim.current.window.cursor
    date = datetime.datetime.today()
    vim.current.buffer[row-1] = date.strftime(format) + ' '

def todo_modify_date(days):
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    a,b = getWord(line, col)
    word = line[a:b]
    try:
        date = datetime.datetime.strptime(word, format)
        date = date + datetime.timedelta(days=days)
        line = line[:a] + date.strftime(format) + line[b:]
        vim.current.buffer[row-1] = line
        print(date_info(date))
    except:
        # Ideally this should execute the increment command
        if days == 1:
            vim.command('normal! ')
        elif days == -1:
            vim.command('normal! ')

def todo_key(line):
    L = [1,'',1,'',1,'',0,0,line]
    Item = line.split()
    try:
        if Item[0] == prefix:
            L[6] = 1
            L[7] = -int(datetime.datetime.strptime(Item[1], format).strftime('%s'))
    except IndexError:
        pass
    for item in Item:
        if item[:4] == 'due:':
            L[0] = 0
            L[1] = item
        if re.match('\(.\)',item):
            L[2] = 0
            L[3] = item
        if item[:2] == 't:':
            L[4] = 0
            L[5] = item
    return tuple(L) 

def todo_sort():
    (row, col) = vim.current.window.cursor
    buf = vim.current.buffer
    line = vim.current.buffer[row-1]
    a,b = getWord(line, col)
    word = line[a:b]
    if marked(word): # sort first on marked keyword
        print('Sorting first on keyword: %s'%word)
        # Sort all the lines with a given tag to the top, then do a normal sort
        # buf[:] = sorted(buf, key=lambda x: (x.find(word)<0, todo_key(x)))
        buf[:] = sorted(buf, key=lambda x: (word.casefold() not in x.casefold(), x))
    else:
        buf[:] = sorted(buf)
        # buf[:] = sorted(buf, key=todo_key)

def todo_update():
    '''Remove all completed tasks and white space lines.
    Create new instances of recurring tasks.
    '''
    buf = vim.current.buffer
    fileroot = vim.eval("expand('%:p')")[:-3]
    logname = fileroot+'log' # Replace txt with log
    tmpname = fileroot+'tmp'
    # print(logname)
    newbuf = []
    with open(tmpname, 'w') as tmpfile:
        for line in buf:
            if line[:len(prefix)+1] == prefix+' ':
                tmpfile.write(line+'\n')
            elif len(line) > 0:
                newbuf.append(line)
        try:
            with open(logname, 'r') as logfile:
                for line in logfile:
                    tmpfile.write(line)
        except IOError:
            pass
    shutil.move(tmpname, logname)
    buf[:] = newbuf


def set_priority(letter):
    (row, col) = vim.current.window.cursor
    buf = vim.current.buffer
    line = vim.current.buffer[row-1]
    if re.match('^\(.\) ',line):
        line = line[4:]
    line = '(%s) '%letter + line
    vim.current.buffer[row-1] = line

# if __name__ == '__main__':
    # import doctest
    # doctest.testmod()
