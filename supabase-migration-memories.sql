-- ── User Memory Store for Beatrice Agent ──
-- Run this in Supabase SQL Editor

CREATE TABLE IF NOT EXISTS memories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id TEXT NOT NULL,
  content TEXT NOT NULL,
  tags TEXT[] DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Index for fast per-user lookups
CREATE INDEX IF NOT EXISTS idx_memories_user_id ON memories(user_id);

-- Index for full-text search on content
CREATE INDEX IF NOT EXISTS idx_memories_content_fts ON memories USING gin(to_tsvector('english', content));

-- Index for tag queries
CREATE INDEX IF NOT EXISTS idx_memories_tags ON memories USING gin(tags);

-- Row-level security: users can only see their own memories
ALTER TABLE memories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own memories"
  ON memories FOR SELECT
  USING (user_id = current_user OR user_id = auth.uid()::text);

CREATE POLICY "Users can insert own memories"
  ON memories FOR INSERT
  WITH CHECK (user_id = current_user OR user_id = auth.uid()::text);

CREATE POLICY "Users can delete own memories"
  ON memories FOR DELETE
  USING (user_id = current_user OR user_id = auth.uid()::text);
