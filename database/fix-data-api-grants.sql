-- Run this once if Supabase Data API returns:
-- permission denied for table profiles
--
-- RLS policies still control what rows are visible. These grants only allow
-- the public browser key to perform SELECT requests through the Data API.

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
