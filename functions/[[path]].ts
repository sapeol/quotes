import { Elysia } from "elysia";

const quotes = JSON.parse(require("fs").readFileSync("src/quotes.json", "utf-8")) as Array<{
  id: string;
  author: string;
  en: string;
}>;

const getRandomQuote = () => {
  const index = Math.floor(Math.random() * quotes.length);
  return quotes[index];
};

const app = new Elysia()
  .get("/", () => "Hello Elysia")
  .get("/random", () => getRandomQuote());

export default app;
