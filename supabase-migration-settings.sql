-- ── Fix user_settings table schema ──
-- Run this in Supabase SQL Editor for project: tcwhnoxzqibqtpgedvbv

-- Rename uid to user_id for consistency with app
ALTER TABLE user_settings RENAME COLUMN uid TO user_id;

-- Rename voice to selected_voice
ALTER TABLE user_settings RENAME COLUMN voice TO selected_voice;

-- Rename system_prompt to custom_prompt
ALTER TABLE user_settings RENAME COLUMN system_prompt TO custom_prompt;

-- Rename user_call_name to user_title (if exists)
DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='user_settings' AND column_name='user_call_name') THEN
    ALTER TABLE user_settings RENAME COLUMN user_call_name TO user_title;
  END IF;
END $$;

-- Add missing columns
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS context_size INTEGER DEFAULT 20;
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS theme TEXT DEFAULT 'dark';
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS ambient_enabled BOOLEAN DEFAULT true;
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS ambient_volume INTEGER DEFAULT 12;
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS censorship_enabled BOOLEAN DEFAULT true;
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();
ALTER TABLE user_settings ADD COLUMN IF NOT EXISTS avatar_url TEXT;

-- Make user_id the primary key
ALTER TABLE user_settings ADD PRIMARY KEY (user_id);
