# Fast random quotes - loads once into memory, instant lookup
# Source this in your ~/.zshrc or ~/.bashrc:
#   source ~/.local/share/quotes/quotes.sh

QUOTES_FILE="${XDG_DATA_HOME:-$HOME/.local/share}/quotes/quotes.txt"

# Load all quotes into array (runs once at shell startup)
if [[ -f "$QUOTES_FILE" ]]; then
    IFS=$'\n' read -d '' -r -a QUOTES < "$QUOTES_FILE"
fi

random_quote() {
    if [[ ${#QUOTES[@]} -gt 0 ]]; then
        echo "${QUOTES[RANDOM % ${#QUOTES[@]}]}"
    fi
}
