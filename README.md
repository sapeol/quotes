# Quotes API

A simple random quotes API built with [Hono](https://hono.dev) and deployed on [Cloudflare Workers](https://workers.cloudflare.com).

## Usage

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
