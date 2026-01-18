#!/usr/bin/env sh
QUOTES_FILE="${XDG_DATA_HOME:-$HOME/.local/share}/quotes/quotes.txt"

# Fast: skip N-1 lines, read one
head -$((RANDOM % 501 + 1)) "$QUOTES_FILE" | tail -1
