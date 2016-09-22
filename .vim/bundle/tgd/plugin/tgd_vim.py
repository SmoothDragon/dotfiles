#!/usr/bin/env python
# import vim
if __name__ != '__main__':
    # Allow doctests to run when not loaded by vim
    import vim 
# print(__name__)

import datetime

# vim.eval('expand("<cword>")')
# might do the same thing
def CursorWord(line, pos):
    '''
    >>> CursorWord('Hello there small fry!',0)
    'Hello'
    >>> CursorWord('Hello there small fry!',18)
    'fry'
    '''
    i=pos
    j=pos
    if len(line) < 1:
        return ''
    if not str.isalpha(line[i]):
        return ''
    while i>0 and str.isalpha(line[i-1]):
        i -= 1
    while j<len(line) and str.isalpha(line[j]):
        j += 1
    return line[i:j]

def cursorWordPos():
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    return getWord(line, col)

def incDate():
    '''
    20100425Su fsoiehoinoegangoen sgh;e 32lk
    '''
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    a, b = cursorWordPos()
    if validDate(line[a:b]):
        line = line[:a] + dateShift(line[a:b]) + line[b:]
        vim.current.buffer[row-1] = line

def decDate():
    '''
    20100417Sa fsoiehoinoegangoen sgh;e 32lk
    '''
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    a, b = cursorWordPos()
    if validDate(line[a:b]):
        line = line[:a] + dateShift(line[a:b], -1) + line[b:]
        vim.current.buffer[row-1] = line

def getWord(line, pos):
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
    if line[pos] == ' ':
        return pos, pos
    front = line[:pos].rfind(' ') + 1 # correct even when search fails
    back = line[pos+1:].find(' ')
    if back == -1:
        back = len(line)
    else:
        back += pos + 1
    return front, back

def validDate(word):
    ''' Check if word is valid TGD date format
    >>> validDate('20000630Tu')
    True
    >>> validDate('34haf8hknk')
    False
    '''
    days = {'Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'}
    if len(word) == 10 and word[-2:] in days and word[:-2].isdigit():
        return True
    elif len(word) == 8 and word.isdigit():
        return True
    else:
        return False

def dateShift(word, dayshift=1):
    ''' Shift TGD date
    >>> dateShift('19730909Su')
    '19730910Mo'
    >>> dateShift('19720804Fr', -1)
    '19720803Th'
    '''
    if not validDate(word):
        return word
    year = int(word[:4])
    month = int(word[4:6])
    day = int(word[6:8])
    date = datetime.datetime(year, month, day)
    date += datetime.timedelta(days=dayshift)
    return date.strftime('%Y%m%d%a')[:-1]

def todo_toggle_completion():
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    format = 'x %Y-%m-%d '
    flength = 13 # Longer than len(format) due to %Y -> 2014
    if line[:2] != 'x ':
        date = datetime.datetime.today()
        line = date.strftime(format) + line
    else:
        try:
            # If start matches date format, remove it
            date = datetime.datetime.strptime(line[:flength], format)
            line = line[flength:]
        except ValueError:
            # Otherwise, just remove the leading 'x ' characters
            line = line[2:]
    vim.current.buffer[row-1] = line

def todo_copy_task():
    '''Copy +tags and @contexts from previous line.
    Will overwrite current line, so it should be called by a vim sequence that
    inserts a new line for the information to be written.
    '''
    (row, col) = vim.current.window.cursor
    prev = vim.current.buffer[row-2]
    date = datetime.datetime.today()
    Item = prev.split()
    line = date.strftime('%Y-%m-%d ') + ' '.join([item for item in Item if item[0] in '+@']) 
    vim.current.buffer[row-1] = line

def todo_modify_date(days):
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    format = '%Y-%m-%d'
    a,b = getWord(line, col)
    word = line[a:b]
    try:
        date = datetime.datetime.strptime(word, format)
        date = date + datetime.timedelta(days=days)
        line = line[:a] + date.strftime(format) + line[b:]
        vim.current.buffer[row-1] = line
    except:
        # Ideally this should execute the increment command
        if days == 1:
            vim.command('normal! ')
        elif days == -1:
            vim.command('normal! ')

# if __name__ == '__main__':
    # import doctest
    # doctest.testmod()
