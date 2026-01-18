#!/usr/bin/env python3
import os
import random

QUOTES_FILE = f"{os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local'))}/share/quotes/quotes.txt"

with open(QUOTES_FILE) as f:
    QUOTES = f.readlines()

print(random.choice(QUOTES).strip())
