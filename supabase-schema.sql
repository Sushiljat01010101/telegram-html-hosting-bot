-- =====================================================
-- Supabase Schema for Telegram HTML Hosting Bot
-- Run this SQL in your Supabase SQL Editor
-- =====================================================

-- Users table
CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  chat_id BIGINT,
  name TEXT,
  joined_at TIMESTAMPTZ DEFAULT now(),
  stats JSONB DEFAULT '{"fileCount": 0, "referrals": [], "baseLimit": 2}'::jsonb,
  premium BOOLEAN DEFAULT false,
  premium_since TEXT,
  premium_until TEXT,
  premium_slots INT,
  premium_duration INT,
  premium_approved_by TEXT,
  premium_approved_at TEXT,
  notifications BOOLEAN DEFAULT true,
  account_deleted BOOLEAN DEFAULT false,
  deleted_at TEXT
);

-- Daily stats table
CREATE TABLE IF NOT EXISTS daily_stats (
  date TEXT PRIMARY KEY,
  users JSONB DEFAULT '[]'::jsonb,
  count INT DEFAULT 0
);

-- Bot config table (stores all admin config values)
CREATE TABLE IF NOT EXISTS bot_config (
  key TEXT PRIMARY KEY,
  value JSONB,
  updated_at TEXT,
  updated_by TEXT
);

-- =====================================================
-- Storage Bucket Setup
-- Run in Supabase Dashboard > Storage > New Bucket
-- Bucket name: uploads
-- Public bucket: YES (so files are publicly accessible)
-- =====================================================

-- Enable RLS (Row Level Security) - disable for server-side usage
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE daily_stats DISABLE ROW LEVEL SECURITY;
ALTER TABLE bot_config DISABLE ROW LEVEL SECURITY;
