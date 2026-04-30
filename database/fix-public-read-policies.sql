-- Run this if rows exist in Supabase tables but the website still shows
-- "尚未填寫" for education, experiences, projects, skills, etc.
--
-- This keeps Row Level Security enabled and only exposes data belonging to
-- profiles where is_published = TRUE.

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
