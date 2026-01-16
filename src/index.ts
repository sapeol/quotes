import { Hono } from "hono";
import quotes from "../quotes.json";

type Quote = {
  id: string;
  author: string;
  en: string;
};

const app = new Hono();

app.get("/", (c) => c.text("Hello Hono"));

app.get("/random", (c) => {
  const index = Math.floor(Math.random() * quotes.length);
  const quote = quotes[index] as Quote;
  return c.json(quote);
});

app.get("/about", (c) => {
  return c.json({
    name: "Quotes API",
    version: "1.0.0",
    description: "A simple random quotes API",
    endpoints: {
      root: "/",
      random: "/random",
      about: "/about"
    },
    stats: {
      totalQuotes: quotes.length
    },
    links: {
      github: "https://github.com/sapeol/quotes",
      docs: "https://github.com/sapeol/quotes#readme"
    }
  });
});

export default app;
