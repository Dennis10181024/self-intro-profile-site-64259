-- Add one new profile.
-- Copy this file into Supabase SQL Editor, edit the values, then run it.
-- Keep username lowercase, use English letters/numbers/hyphens only.

DO $$
DECLARE
    new_profile_id UUID;
    skill_cat_id UUID;
    new_project_id UUID;
BEGIN
    INSERT INTO public.profiles (
        username,
        name,
        title,
        birthday,
        location,
        bio,
        avatar_url,
        cover_url,
        resume_url,
        theme_color,
        is_published
    )
    VALUES (
        'new-friend',
        '王小華',
        '資訊工程學生 | 後端與資料庫開發',
        '2005-03-12',
        '台中，台灣',
        '喜歡資料庫設計、API 開發與雲端服務，正在累積完整產品開發經驗。',
        '',
        '',
        '',
        '#0f766e',
        TRUE
    )
    ON CONFLICT (username) DO UPDATE SET
        name = EXCLUDED.name,
        title = EXCLUDED.title,
        birthday = EXCLUDED.birthday,
        location = EXCLUDED.location,
        bio = EXCLUDED.bio,
        avatar_url = EXCLUDED.avatar_url,
        cover_url = EXCLUDED.cover_url,
        resume_url = EXCLUDED.resume_url,
        theme_color = EXCLUDED.theme_color,
        is_published = EXCLUDED.is_published
    RETURNING id INTO new_profile_id;

    -- Re-running this template replaces the old related data for the same username.
    DELETE FROM public.project_links WHERE project_id IN (
        SELECT id FROM public.projects WHERE profile_id = new_profile_id
    );
    DELETE FROM public.skills WHERE category_id IN (
        SELECT id FROM public.skill_categories WHERE profile_id = new_profile_id
    );
    DELETE FROM public.profile_links WHERE profile_id = new_profile_id;
    DELETE FROM public.highlights WHERE profile_id = new_profile_id;
    DELETE FROM public.education WHERE profile_id = new_profile_id;
    DELETE FROM public.experiences WHERE profile_id = new_profile_id;
    DELETE FROM public.projects WHERE profile_id = new_profile_id;
    DELETE FROM public.skill_categories WHERE profile_id = new_profile_id;
    DELETE FROM public.certifications WHERE profile_id = new_profile_id;
    DELETE FROM public.awards WHERE profile_id = new_profile_id;
    DELETE FROM public.languages WHERE profile_id = new_profile_id;
    DELETE FROM public.interests WHERE profile_id = new_profile_id;

    INSERT INTO public.profile_links (profile_id, type, label, value, url, sort_order)
    VALUES
        (new_profile_id, 'email', 'Email', 'friend@example.com', 'mailto:friend@example.com', 1),
        (new_profile_id, 'github', 'GitHub', 'github.com/friend', 'https://github.com/friend', 2),
        (new_profile_id, 'website', 'Website', 'friend.dev', 'https://example.com', 3);

    INSERT INTO public.highlights (profile_id, label, value, sort_order)
    VALUES
        (new_profile_id, '主修', '資訊工程', 1),
        (new_profile_id, '專長', 'Backend', 2),
        (new_profile_id, '方向', '雲端服務', 3);

    INSERT INTO public.education (
        profile_id, school, major, degree, start_date, end_date,
        is_current, is_transfer, description, sort_order
    )
    VALUES (
        new_profile_id,
        '逢甲大學',
        '資訊工程與電腦科學系',
        '學士',
        '2024-09-01',
        NULL,
        TRUE,
        FALSE,
        '專注於資料庫、後端系統與雲端應用。',
        1
    );

    INSERT INTO public.experiences (
        profile_id, organization, role, employment_type, start_date, end_date,
        is_current, description, sort_order
    )
    VALUES (
        new_profile_id,
        '某某工作室',
        '後端實習生',
        'Internship',
        '2025-07-01',
        NULL,
        TRUE,
        '負責 API 開發、資料表設計與後端服務串接。',
        1
    );

    INSERT INTO public.projects (
        profile_id, title, role, tech_stack, description, image_url, sort_order
    )
    VALUES (
        new_profile_id,
        '個人任務管理 API',
        '開發者',
        'Node.js, PostgreSQL, Supabase',
        '設計可管理任務、標籤與狀態的 REST API，練習資料庫關聯與權限控管。',
        '',
        1
    )
    RETURNING id INTO new_project_id;

    INSERT INTO public.project_links (project_id, label, url, sort_order)
    VALUES
        (new_project_id, 'GitHub', 'https://github.com/friend/task-api', 1);

    INSERT INTO public.skill_categories (profile_id, name, sort_order)
    VALUES (new_profile_id, 'Backend', 1)
    RETURNING id INTO skill_cat_id;

    INSERT INTO public.skills (category_id, name, level, sort_order)
    VALUES
        (skill_cat_id, 'PostgreSQL', 'Intermediate', 1),
        (skill_cat_id, 'Node.js', 'Intermediate', 2),
        (skill_cat_id, 'Supabase', 'Learning', 3);

    INSERT INTO public.skill_categories (profile_id, name, sort_order)
    VALUES (new_profile_id, 'Tools', 2)
    RETURNING id INTO skill_cat_id;

    INSERT INTO public.skills (category_id, name, level, sort_order)
    VALUES
        (skill_cat_id, 'Git', 'Intermediate', 1),
        (skill_cat_id, 'Linux', 'Learning', 2);

    INSERT INTO public.languages (profile_id, name, proficiency, sort_order)
    VALUES
        (new_profile_id, '中文', '母語', 1),
        (new_profile_id, 'English', '日常閱讀', 2);

    INSERT INTO public.interests (profile_id, name, sort_order)
    VALUES
        (new_profile_id, '後端開發', 1),
        (new_profile_id, '資料庫設計', 2),
        (new_profile_id, '雲端服務', 3);
END $$;
