# Quotes API

A simple random quotes API built with [Hono](https://hono.dev) and deployed on [Cloudflare Workers](https://workers.cloudflare.com).

## Usage Options

### Option 1: Hosted API (for applications)

**Best for:** Websites, apps, scripts that need remote quotes

```bash
curl https://quotes.sudeepzmr.workers.dev/random
```

**Why use the API?**
- Works anywhere with internet access
- No local setup required
- Always gets the latest quotes
- Great for integration into web apps

### Option 2: Local Script (for Starship/shell prompts)

**Best for:** Shell prompts, offline usage, instant quotes

```bash
./scripts/setup-starship.sh
```

Then add to your `~/.config/starship.toml`:
```toml
[custom.quote]
command = "~/.local/bin/starship-quote"
description = "Random quote"
format = "\n💡 [$output]($style)\n"
```

**Why use the local script?**
- Works offline (no network dependency)
- ~2x faster than API calls (~4ms vs ~100ms)
- Zero latency for shell prompts
- No API rate limits

## API Usage

### Get a random quote

```bash
curl https://quotes.sudeepzmr.workers.dev/random
```

**Response:**
```json
{
  "id": "5a6ce86e2af929789500e7e4",
  "author": "Edsger W. Dijkstra",
  "en": "Computer Science is no more about computers than astronomy is about telescopes."
}
```

### About the API

```bash
curl https://quotes.sudeepzmr.workers.dev/about
```

## Endpoints

| Endpoint | Description |
|----------|-------------|
| `GET /` | Health check |
| `GET /random` | Returns a random quote from the collection |
| `GET /about` | API information and stats |

## Stats

- **Total quotes**: 501
- **Deployment**: Cloudflare Workers
- **Source**: [GitHub](https://github.com/sapeol/quotes)

## Local Development

```bash
# Install dependencies
bun install

# Run dev server
bun run dev
```

## Deployment

```bash
bun run deploy
```
