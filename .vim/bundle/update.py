#!/usr/bin/env python3

import os
import subprocess
import urllib.parse

Site = [
        # 'https://github.com/nvie/vim-flake8',
        'https://github.com/tpope/vim-fugitive',
        'https://github.com/tpope/vim-pathogen',
        'https://github.com/tpope/vim-sensible',
        'https://github.com/tmhedberg/SimpylFold',
        'https://github.com/epeli/slimux',
        'https://github.com/tpope/vim-surround',
        'https://github.com/tpope/vim-unimpaired',
        'https://github.com/w0rp/ale',
        'https://github.com/freitass/todo.txt-vim',
        'https://github.com/sirtaj/vim-openscad',
        'https://github.com/pangloss/vim-javascript',
        'https://github.com/elixir-editors/vim-elixir',
        'https://github.com/pangloss/vim-javascript',
        'https://github.com/Konfekt/vim-CtrlXA',
        ]

for site in Site:
    url = urllib.parse.urlparse(site)
    path = url.path
    name = os.path.split(path)[-1]
    if os.path.isdir(name):
        print(name)
        subprocess.call('(cd %s && git pull)' % name, shell=True)
    else:
        subprocess.call('git clone '+site, shell=True)
