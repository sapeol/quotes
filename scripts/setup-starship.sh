#!/usr/bin/env sh
# Setup script for Starship quotes - installs local quotes and C binary
# Usage: ./scripts/setup-starship.sh

set -e

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/quotes"
BIN_DIR="$HOME/.local/bin"
QUOTES_TXT="$DATA_DIR/quotes.txt"
QUOTES_JSON="$REPO_DIR/quotes.json"
SOURCE_C="$REPO_DIR/starship-quote.c"
BINARY="$BIN_DIR/starship-quote"
STARSHIP_CONFIG="$HOME/.config/starship.toml"

echo "==> Setting up Starship quotes..."

# Create directories
mkdir -p "$DATA_DIR" "$BIN_DIR"

# Convert JSON to plain text if needed
if [[ ! -f "$QUOTES_TXT" ]] || [[ "$QUOTES_JSON" -nt "$QUOTES_TXT" ]]; then
    echo "==> Converting quotes.json to quotes.txt..."
    if command -v jq >/dev/null 2>&1; then
        jq -r '.[] | "\(.en) — \(.author)"' "$QUOTES_JSON" > "$QUOTES_TXT"
    else
        echo "Error: jq required. Install with: brew install jq"
        exit 1
    fi
    echo "==> Quotes saved to $QUOTES_TXT"
fi

# Compile C binary
if [[ ! -f "$BINARY" ]] || [[ "$SOURCE_C" -nt "$BINARY" ]]; then
    echo "==> Compiling starship-quote binary..."
    cc -O2 -o "$BINARY" "$SOURCE_C"
    echo "==> Binary installed to $BINARY"
fi

# Optional: Update starship.toml
if [[ -f "$STARSHIP_CONFIG" ]]; then
    if grep -q "curl.*quotes" "$STARSHIP_CONFIG" 2>/dev/null; then
        echo ""
        echo "==> Your starship.toml still uses curl API."
        echo "   Update [custom.quote] command to: ~/.local/bin/starship-quote"
    fi
fi

echo ""
echo "==> Done! Test with: $BINARY"
"$BINARY"
