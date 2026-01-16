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

export default app;
