-- Self intro site relational schema for Supabase / PostgreSQL.
-- Run this file first in the Supabase SQL editor.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(60) UNIQUE NOT NULL,
    name VARCHAR(80) NOT NULL,
    title VARCHAR(140),
    birthday DATE,
    location VARCHAR(120),
    bio TEXT,
    avatar_url TEXT,
    cover_url TEXT,
    resume_url TEXT,
    theme_color VARCHAR(20) DEFAULT '#0f766e',
    is_published BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT profiles_username_format CHECK (username ~ '^[a-z0-9][a-z0-9-]{1,58}[a-z0-9]$')
);

CREATE TABLE IF NOT EXISTS public.profile_links (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    type VARCHAR(40) NOT NULL,
    label VARCHAR(80) NOT NULL,
    value VARCHAR(180),
    url TEXT,
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.highlights (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    label VARCHAR(80) NOT NULL,
    value VARCHAR(80) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.education (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    school VARCHAR(140) NOT NULL,
    major VARCHAR(140) NOT NULL,
    degree VARCHAR(80),
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    is_transfer BOOLEAN NOT NULL DEFAULT FALSE,
    description TEXT,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.experiences (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    organization VARCHAR(140) NOT NULL,
    role VARCHAR(140) NOT NULL,
    employment_type VARCHAR(80),
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    description TEXT,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    title VARCHAR(160) NOT NULL,
    role VARCHAR(120),
    tech_stack TEXT,
    description TEXT,
    image_url TEXT,
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.project_links (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    project_id UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
    label VARCHAR(80) NOT NULL,
    url TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.skill_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    name VARCHAR(80) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE (profile_id, name)
);

CREATE TABLE IF NOT EXISTS public.skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID NOT NULL REFERENCES public.skill_categories(id) ON DELETE CASCADE,
    name VARCHAR(80) NOT NULL,
    level VARCHAR(40),
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE (category_id, name)
);

CREATE TABLE IF NOT EXISTS public.certifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    name VARCHAR(160) NOT NULL,
    issuer VARCHAR(140),
    issued_date DATE,
    credential_url TEXT,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.awards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    title VARCHAR(160) NOT NULL,
    issuer VARCHAR(140),
    award_date DATE,
    description TEXT,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.languages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    name VARCHAR(80) NOT NULL,
    proficiency VARCHAR(80),
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.interests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    name VARCHAR(80) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS profiles_username_idx ON public.profiles(username);
CREATE INDEX IF NOT EXISTS profile_links_profile_id_idx ON public.profile_links(profile_id);
CREATE INDEX IF NOT EXISTS highlights_profile_id_idx ON public.highlights(profile_id);
CREATE INDEX IF NOT EXISTS education_profile_id_idx ON public.education(profile_id);
CREATE INDEX IF NOT EXISTS experiences_profile_id_idx ON public.experiences(profile_id);
CREATE INDEX IF NOT EXISTS projects_profile_id_idx ON public.projects(profile_id);
CREATE INDEX IF NOT EXISTS project_links_project_id_idx ON public.project_links(project_id);
CREATE INDEX IF NOT EXISTS skill_categories_profile_id_idx ON public.skill_categories(profile_id);
CREATE INDEX IF NOT EXISTS skills_category_id_idx ON public.skills(category_id);
CREATE INDEX IF NOT EXISTS certifications_profile_id_idx ON public.certifications(profile_id);
CREATE INDEX IF NOT EXISTS awards_profile_id_idx ON public.awards(profile_id);
CREATE INDEX IF NOT EXISTS languages_profile_id_idx ON public.languages(profile_id);
CREATE INDEX IF NOT EXISTS interests_profile_id_idx ON public.interests(profile_id);

GRANT USAGE ON SCHEMA public TO anon, authenticated;

GRANT SELECT ON public.profiles TO anon, authenticated;
GRANT SELECT ON public.profile_links TO anon, authenticated;
GRANT SELECT ON public.highlights TO anon, authenticated;
GRANT SELECT ON public.education TO anon, authenticated;
GRANT SELECT ON public.experiences TO anon, authenticated;
GRANT SELECT ON public.projects TO anon, authenticated;
GRANT SELECT ON public.project_links TO anon, authenticated;
GRANT SELECT ON public.skill_categories TO anon, authenticated;
GRANT SELECT ON public.skills TO anon, authenticated;
GRANT SELECT ON public.certifications TO anon, authenticated;
GRANT SELECT ON public.awards TO anon, authenticated;
GRANT SELECT ON public.languages TO anon, authenticated;
GRANT SELECT ON public.interests TO anon, authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO anon, authenticated;

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS set_profiles_updated_at ON public.profiles;
CREATE TRIGGER set_profiles_updated_at
BEFORE UPDATE ON public.profiles
FOR EACH ROW
EXECUTE FUNCTION public.set_updated_at();

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profile_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.highlights ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.education ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.experiences ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.project_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.skill_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.certifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.awards ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.languages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.interests ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Published profiles are public" ON public.profiles;
CREATE POLICY "Published profiles are public"
ON public.profiles FOR SELECT
USING (is_published = TRUE);

DROP POLICY IF EXISTS "Published profile links are public" ON public.profile_links;
CREATE POLICY "Published profile links are public"
ON public.profile_links FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = profile_links.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published highlights are public" ON public.highlights;
CREATE POLICY "Published highlights are public"
ON public.highlights FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = highlights.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published education is public" ON public.education;
CREATE POLICY "Published education is public"
ON public.education FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = education.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published experiences are public" ON public.experiences;
CREATE POLICY "Published experiences are public"
ON public.experiences FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = experiences.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published projects are public" ON public.projects;
CREATE POLICY "Published projects are public"
ON public.projects FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = projects.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published project links are public" ON public.project_links;
CREATE POLICY "Published project links are public"
ON public.project_links FOR SELECT
USING (EXISTS (
    SELECT 1
    FROM public.projects
    JOIN public.profiles ON profiles.id = projects.profile_id
    WHERE projects.id = project_links.project_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published skill categories are public" ON public.skill_categories;
CREATE POLICY "Published skill categories are public"
ON public.skill_categories FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = skill_categories.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published skills are public" ON public.skills;
CREATE POLICY "Published skills are public"
ON public.skills FOR SELECT
USING (EXISTS (
    SELECT 1
    FROM public.skill_categories
    JOIN public.profiles ON profiles.id = skill_categories.profile_id
    WHERE skill_categories.id = skills.category_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published certifications are public" ON public.certifications;
CREATE POLICY "Published certifications are public"
ON public.certifications FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = certifications.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published awards are public" ON public.awards;
CREATE POLICY "Published awards are public"
ON public.awards FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = awards.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published languages are public" ON public.languages;
CREATE POLICY "Published languages are public"
ON public.languages FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = languages.profile_id
    AND profiles.is_published = TRUE
));

DROP POLICY IF EXISTS "Published interests are public" ON public.interests;
CREATE POLICY "Published interests are public"
ON public.interests FOR SELECT
USING (EXISTS (
    SELECT 1 FROM public.profiles
    WHERE profiles.id = interests.profile_id
    AND profiles.is_published = TRUE
));
