-- Demo data. Run this after database/schema.sql.

DO $$
DECLARE
    p1 UUID;
    p2 UUID;
    cat UUID;
    project_id UUID;
BEGIN
    INSERT INTO public.profiles (
        username, name, title, birthday, location, bio, avatar_url, cover_url, resume_url, theme_color, is_published
    )
    VALUES (
        'xuyizhan',
        '徐翊展',
        '資訊工程與電腦科學系學生 | 軟體工程與 AI 應用',
        '2006-01-01',
        '台中，台灣',
        '具備軟硬體整合能力，熱衷於 AI 應用開發、自動化流程與系統程式設計。目標持續精進技術，未來朝半導體或頂尖科技業軟體工程師邁進。',
        '',
        'https://images.unsplash.com/photo-1498050108023-c5249f4df0852?auto=format&fit=crop&w=1400&q=80',
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
    RETURNING id INTO p1;

    DELETE FROM public.project_links WHERE project_id IN (SELECT id FROM public.projects WHERE profile_id = p1);
    DELETE FROM public.skills WHERE category_id IN (SELECT id FROM public.skill_categories WHERE profile_id = p1);
    DELETE FROM public.profile_links WHERE profile_id = p1;
    DELETE FROM public.highlights WHERE profile_id = p1;
    DELETE FROM public.education WHERE profile_id = p1;
    DELETE FROM public.experiences WHERE profile_id = p1;
    DELETE FROM public.projects WHERE profile_id = p1;
    DELETE FROM public.skill_categories WHERE profile_id = p1;
    DELETE FROM public.certifications WHERE profile_id = p1;
    DELETE FROM public.awards WHERE profile_id = p1;
    DELETE FROM public.languages WHERE profile_id = p1;
    DELETE FROM public.interests WHERE profile_id = p1;

    INSERT INTO public.profile_links (profile_id, type, label, value, url, sort_order)
    VALUES
        (p1, 'email', 'Email', 'your.email@example.com', 'mailto:your.email@example.com', 1),
        (p1, 'github', 'GitHub', 'github.com/yourusername', 'https://github.com/yourusername', 2),
        (p1, 'linkedin', 'LinkedIn', 'linkedin.com/in/yourusername', 'https://linkedin.com/in/yourusername', 3);

    INSERT INTO public.highlights (profile_id, label, value, sort_order)
    VALUES
        (p1, '主修', '資訊工程', 1),
        (p1, '方向', 'AI 應用', 2),
        (p1, '目標', '軟體工程師', 3);

    INSERT INTO public.education (profile_id, school, major, degree, start_date, end_date, is_current, is_transfer, description, sort_order)
    VALUES
        (p1, '逢甲大學', '資訊工程與電腦科學系', '學士', '2024-09-01', NULL, TRUE, TRUE, '專注於演算法、資料結構與數位邏輯設計。', 1),
        (p1, '東海大學', '大學一年級', '學士', '2023-09-01', '2024-06-30', FALSE, FALSE, '完成大一基礎課程後轉學。', 2);

    INSERT INTO public.experiences (profile_id, organization, role, employment_type, start_date, end_date, is_current, description, sort_order)
    VALUES
        (p1, 'Google Developer Groups on Campus (GDSC)', '教學幹部', '校園社群', '2025-11-01', NULL, TRUE, '籌辦技術工作坊，包含 Python、Gemini API 應用與 n8n 自動化流程教學，協助成員掌握 AI 工具。', 1);

    INSERT INTO public.projects (profile_id, title, role, tech_stack, description, image_url, sort_order)
    VALUES (
        p1,
        'Edge Collaborative Disaster Response Proxy',
        '開發者',
        'Python, Hybrid RAG, AI',
        '開發基於 Hybrid RAG 技術的離線 AI 助理系統，應用於災難協同應變之概念驗證。',
        'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80',
        1
    )
    RETURNING id INTO project_id;

    INSERT INTO public.project_links (project_id, label, url, sort_order)
    VALUES (project_id, 'GitHub', 'https://github.com/yourusername/proxy', 1);

    INSERT INTO public.projects (profile_id, title, role, tech_stack, description, image_url, sort_order)
    VALUES (
        p1,
        'SIC/XE 系統程式開發',
        '開發者',
        'Assembly, SicTools',
        '在 SIC/XE 機器架構上實作 Quick Sort 演算法，進行效能分析。',
        '',
        2
    );

    INSERT INTO public.skill_categories (profile_id, name, sort_order)
    VALUES (p1, 'Programming Languages', 1)
    RETURNING id INTO cat;
    INSERT INTO public.skills (category_id, name, level, sort_order)
    VALUES
        (cat, 'Python', 'Advanced', 1),
        (cat, 'C/C++', 'Intermediate', 2),
        (cat, 'Assembly (SIC/XE)', 'Intermediate', 3);

    INSERT INTO public.skill_categories (profile_id, name, sort_order)
    VALUES (p1, 'AI & Automation', 2)
    RETURNING id INTO cat;
    INSERT INTO public.skills (category_id, name, level, sort_order)
    VALUES
        (cat, 'Gemini API', 'Intermediate', 1),
        (cat, 'n8n', 'Intermediate', 2),
        (cat, 'Hybrid RAG', 'Learning', 3);

    INSERT INTO public.skill_categories (profile_id, name, sort_order)
    VALUES (p1, 'Tools & Platforms', 3)
    RETURNING id INTO cat;
    INSERT INTO public.skills (category_id, name, level, sort_order)
    VALUES
        (cat, 'Linux', 'Intermediate', 1),
        (cat, 'Git', 'Intermediate', 2),
        (cat, 'Supabase', 'Learning', 3);

    INSERT INTO public.certifications (profile_id, name, issuer, issued_date, credential_url, sort_order)
    VALUES
        (p1, 'AI 應用與自動化工作坊', 'GDSC', '2025-11-01', '', 1);

    INSERT INTO public.awards (profile_id, title, issuer, award_date, description, sort_order)
    VALUES
        (p1, '專題概念驗證', 'Course Project', '2025-06-01', '完成離線 AI 助理系統 prototype。', 1);

    INSERT INTO public.languages (profile_id, name, proficiency, sort_order)
    VALUES
        (p1, '中文', '母語', 1),
        (p1, 'English', '工作閱讀', 2);

    INSERT INTO public.interests (profile_id, name, sort_order)
    VALUES
        (p1, 'AI 工具', 1),
        (p1, '系統程式', 2),
        (p1, '半導體軟體', 3);

    INSERT INTO public.profiles (
        username, name, title, birthday, location, bio, avatar_url, cover_url, theme_color, is_published
    )
    VALUES (
        'chen-xiao-ming',
        '陳小明',
        '前端工程師',
        '2004-05-18',
        '台北，台灣',
        '專注於 React 開發，喜歡打造流暢的互動體驗，也重視設計系統與元件可維護性。',
        '',
        'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=1400&q=80',
        '#2563eb',
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
        theme_color = EXCLUDED.theme_color,
        is_published = EXCLUDED.is_published
    RETURNING id INTO p2;

    DELETE FROM public.project_links WHERE project_id IN (SELECT id FROM public.projects WHERE profile_id = p2);
    DELETE FROM public.skills WHERE category_id IN (SELECT id FROM public.skill_categories WHERE profile_id = p2);
    DELETE FROM public.profile_links WHERE profile_id = p2;
    DELETE FROM public.highlights WHERE profile_id = p2;
    DELETE FROM public.education WHERE profile_id = p2;
    DELETE FROM public.experiences WHERE profile_id = p2;
    DELETE FROM public.projects WHERE profile_id = p2;
    DELETE FROM public.skill_categories WHERE profile_id = p2;
    DELETE FROM public.certifications WHERE profile_id = p2;
    DELETE FROM public.awards WHERE profile_id = p2;
    DELETE FROM public.languages WHERE profile_id = p2;
    DELETE FROM public.interests WHERE profile_id = p2;

    INSERT INTO public.profile_links (profile_id, type, label, value, url, sort_order)
    VALUES
        (p2, 'email', 'Email', 'ming@example.com', 'mailto:ming@example.com', 1),
        (p2, 'website', 'Portfolio', 'chen.dev', 'https://example.com', 2);

    INSERT INTO public.highlights (profile_id, label, value, sort_order)
    VALUES
        (p2, '專長', 'React', 1),
        (p2, '關注', 'UI 系統', 2),
        (p2, '經驗', 'Frontend', 3);

    INSERT INTO public.experiences (profile_id, organization, role, employment_type, start_date, end_date, is_current, description, sort_order)
    VALUES
        (p2, '某某科技公司', '前端實習生', 'Internship', '2024-07-01', NULL, TRUE, '負責維護公司內部管理系統的 UI 元件。', 1);

    INSERT INTO public.skill_categories (profile_id, name, sort_order)
    VALUES (p2, 'Frontend', 1)
    RETURNING id INTO cat;
    INSERT INTO public.skills (category_id, name, level, sort_order)
    VALUES
        (cat, 'React', 'Advanced', 1),
        (cat, 'TypeScript', 'Intermediate', 2),
        (cat, 'CSS', 'Advanced', 3);

    INSERT INTO public.languages (profile_id, name, proficiency, sort_order)
    VALUES
        (p2, '中文', '母語', 1),
        (p2, 'English', '日常溝通', 2);

    INSERT INTO public.interests (profile_id, name, sort_order)
    VALUES
        (p2, '設計系統', 1),
        (p2, '互動動畫', 2),
        (p2, 'Web Performance', 3);
END $$;
