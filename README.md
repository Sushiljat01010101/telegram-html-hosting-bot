# Telegram HTML Hosting Bot

  Telegram bot for free HTML file hosting using Supabase (PostgreSQL + Storage).

  ## Environment Variables

  | Variable | Description |
  |---|---|
  | `TELEGRAM_BOT_TOKEN` | From @BotFather |
  | `SUPABASE_URL` | Supabase project URL |
  | `SUPABASE_SERVICE_KEY` | Supabase service role key |
  | `ADMIN_ID` | Your Telegram user ID |
  | `SESSION_SECRET` | Any random string |

  ## Deploy on Render

  Connect this repo on Render as a Web Service — `render.yaml` will auto-configure everything.
  Start command: `node bot.cjs`
  