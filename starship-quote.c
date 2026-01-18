// Fast random quote generator for Starship
// Compile: cc -O2 -o ~/.local/bin/starship-quote starship-quote.c

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_QUOTES 600
#define MAX_LINE_LEN 500

int main(void) {
    FILE *f;
    char path[256], *home, *data_home;
    char *quotes[MAX_QUOTES];
    char line[MAX_LINE_LEN];
    int count = 0;

    data_home = getenv("XDG_DATA_HOME");
    home = getenv("HOME");

    // Build path to quotes.txt
    if (data_home) {
        snprintf(path, sizeof(path), "%s/share/quotes/quotes.txt", data_home);
    } else {
        snprintf(path, sizeof(path), "%s/.local/share/quotes/quotes.txt", home);
    }

    f = fopen(path, "r");
    if (!f) {
        fprintf(stderr, "Error: quotes.txt not found at %s\n", path);
        fprintf(stderr, "Run: cp quotes.txt ~/.local/share/quotes/\n");
        return 1;
    }

    // Read all quotes into memory
    while (fgets(line, sizeof(line), f) && count < MAX_QUOTES) {
        line[strcspn(line, "\n")] = '\0';
        quotes[count] = strdup(line);
        count++;
    }
    fclose(f);

    // Print random quote
    srand(time(NULL));
    printf("%s\n", quotes[rand() % count]);

    return 0;
}
