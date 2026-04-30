const LOCAL_PROFILES = [
  {
    username: "xuyizhan",
    name: "徐翊展",
    title: "資訊工程與電腦科學系學生 | 軟體工程與 AI 應用",
    birthday: "2006-01-01",
    location: "台中，台灣",
    bio: "具備軟硬體整合能力，熱衷於 AI 應用開發、自動化流程與系統程式設計。目標持續精進技術，未來朝半導體或頂尖科技業軟體工程師邁進。",
    avatar_url: "",
    cover_url:
      "https://images.unsplash.com/photo-1498050108023-c5249f4df0852?auto=format&fit=crop&w=1400&q=80",
    theme_color: "#0f766e",
    profile_links: [
      {
        type: "email",
        label: "Email",
        value: "your.email@example.com",
        url: "mailto:your.email@example.com",
        sort_order: 1
      },
      {
        type: "github",
        label: "GitHub",
        value: "github.com/yourusername",
        url: "https://github.com/yourusername",
        sort_order: 2
      },
      {
        type: "linkedin",
        label: "LinkedIn",
        value: "linkedin.com/in/yourusername",
        url: "https://linkedin.com/in/yourusername",
        sort_order: 3
      }
    ],
    highlights: [
      { label: "主修", value: "資訊工程", sort_order: 1 },
      { label: "方向", value: "AI 應用", sort_order: 2 },
      { label: "目標", value: "軟體工程師", sort_order: 3 }
    ],
    education: [
      {
        school: "逢甲大學",
        major: "資訊工程與電腦科學系",
        degree: "學士",
        start_date: "2024-09-01",
        end_date: null,
        is_current: true,
        is_transfer: true,
        description: "專注於演算法、資料結構與數位邏輯設計。",
        sort_order: 1
      },
      {
        school: "東海大學",
        major: "大學一年級",
        degree: "學士",
        start_date: "2023-09-01",
        end_date: "2024-06-30",
        is_current: false,
        is_transfer: false,
        description: "完成大一基礎課程後轉學。",
        sort_order: 2
      }
    ],
    experiences: [
      {
        organization: "Google Developer Groups on Campus (GDSC)",
        role: "教學幹部",
        employment_type: "校園社群",
        start_date: "2025-11-01",
        end_date: null,
        is_current: true,
        description:
          "籌辦技術工作坊，包含 Python、Gemini API 應用與 n8n 自動化流程教學，協助成員掌握 AI 工具。",
        sort_order: 1
      }
    ],
    projects: [
      {
        title: "Edge Collaborative Disaster Response Proxy",
        role: "開發者",
        tech_stack: "Python, Hybrid RAG, AI",
        description:
          "開發基於 Hybrid RAG 技術的離線 AI 助理系統，應用於災難協同應變之概念驗證。",
        image_url:
          "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80",
        sort_order: 1,
        project_links: [
          {
            label: "GitHub",
            url: "https://github.com/yourusername/proxy",
            sort_order: 1
          }
        ]
      },
      {
        title: "SIC/XE 系統程式開發",
        role: "開發者",
        tech_stack: "Assembly, SicTools",
        description:
          "在 SIC/XE 機器架構上實作 Quick Sort 演算法，進行效能分析。",
        image_url: "",
        sort_order: 2,
        project_links: []
      }
    ],
    skill_categories: [
      {
        name: "Programming Languages",
        sort_order: 1,
        skills: [
          { name: "Python", level: "Advanced", sort_order: 1 },
          { name: "C/C++", level: "Intermediate", sort_order: 2 },
          { name: "Assembly (SIC/XE)", level: "Intermediate", sort_order: 3 }
        ]
      },
      {
        name: "AI & Automation",
        sort_order: 2,
        skills: [
          { name: "Gemini API", level: "Intermediate", sort_order: 1 },
          { name: "n8n", level: "Intermediate", sort_order: 2 },
          { name: "Hybrid RAG", level: "Learning", sort_order: 3 }
        ]
      },
      {
        name: "Tools & Platforms",
        sort_order: 3,
        skills: [
          { name: "Linux", level: "Intermediate", sort_order: 1 },
          { name: "Git", level: "Intermediate", sort_order: 2 },
          { name: "Supabase", level: "Learning", sort_order: 3 }
        ]
      }
    ],
    certifications: [
      {
        name: "AI 應用與自動化工作坊",
        issuer: "GDSC",
        issued_date: "2025-11-01",
        credential_url: "",
        sort_order: 1
      }
    ],
    awards: [
      {
        title: "專題概念驗證",
        issuer: "Course Project",
        award_date: "2025-06-01",
        description: "完成離線 AI 助理系統 prototype。",
        sort_order: 1
      }
    ],
    languages: [
      { name: "中文", proficiency: "母語", sort_order: 1 },
      { name: "English", proficiency: "工作閱讀", sort_order: 2 }
    ],
    interests: [
      { name: "AI 工具", sort_order: 1 },
      { name: "系統程式", sort_order: 2 },
      { name: "半導體軟體", sort_order: 3 }
    ]
  },
  {
    username: "chen-xiao-ming",
    name: "陳小明",
    title: "前端工程師",
    birthday: "2004-05-18",
    location: "台北，台灣",
    bio: "專注於 React 開發，喜歡打造流暢的互動體驗，也重視設計系統與元件可維護性。",
    avatar_url: "",
    cover_url:
      "https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=1400&q=80",
    theme_color: "#2563eb",
    profile_links: [
      {
        type: "email",
        label: "Email",
        value: "ming@example.com",
        url: "mailto:ming@example.com",
        sort_order: 1
      },
      {
        type: "website",
        label: "Portfolio",
        value: "chen.dev",
        url: "https://example.com",
        sort_order: 2
      }
    ],
    highlights: [
      { label: "專長", value: "React", sort_order: 1 },
      { label: "關注", value: "UI 系統", sort_order: 2 },
      { label: "經驗", value: "Frontend", sort_order: 3 }
    ],
    education: [],
    experiences: [
      {
        organization: "某某科技公司",
        role: "前端實習生",
        employment_type: "Internship",
        start_date: "2024-07-01",
        end_date: null,
        is_current: true,
        description: "負責維護公司內部管理系統的 UI 元件。",
        sort_order: 1
      }
    ],
    projects: [],
    skill_categories: [
      {
        name: "Frontend",
        sort_order: 1,
        skills: [
          { name: "React", level: "Advanced", sort_order: 1 },
          { name: "TypeScript", level: "Intermediate", sort_order: 2 },
          { name: "CSS", level: "Advanced", sort_order: 3 }
        ]
      }
    ],
    certifications: [],
    awards: [],
    languages: [
      { name: "中文", proficiency: "母語", sort_order: 1 },
      { name: "English", proficiency: "日常溝通", sort_order: 2 }
    ],
    interests: [
      { name: "設計系統", sort_order: 1 },
      { name: "互動動畫", sort_order: 2 },
      { name: "Web Performance", sort_order: 3 }
    ]
  }
];

const SELECT_WITH_RELATIONS = `
  *,
  profile_links(*),
  highlights(*),
  education(*),
  experiences(*),
  projects(*, project_links(*)),
  skill_categories(*, skills(*)),
  certifications(*),
  awards(*),
  languages(*),
  interests(*)
`;

const state = {
  client: null,
  source: "Local data",
  summaries: [],
  activeProfile: null
};

const els = {
  root: document.documentElement,
  loading: document.querySelector("#loadingState"),
  shell: document.querySelector("#profileShell"),
  notFound: document.querySelector("#notFoundState"),
  dataStatus: document.querySelector("#dataStatus"),
  select: document.querySelector("#profileSelect"),
  copyLinkButton: document.querySelector("#copyLinkButton"),
  coverImage: document.querySelector("#coverImage"),
  avatarImage: document.querySelector("#avatarImage"),
  avatarFallback: document.querySelector("#avatarFallback"),
  username: document.querySelector("#profileUsername"),
  name: document.querySelector("#profileName"),
  title: document.querySelector("#profileTitle"),
  birthday: document.querySelector("#profileBirthday"),
  location: document.querySelector("#profileLocation"),
  links: document.querySelector("#profileLinks"),
  bio: document.querySelector("#profileBio"),
  highlights: document.querySelector("#highlightGrid"),
  education: document.querySelector("#educationList"),
  experiences: document.querySelector("#experienceList"),
  projects: document.querySelector("#projectGrid"),
  skills: document.querySelector("#skillGroups"),
  more: document.querySelector("#moreInfo")
};

document.addEventListener("DOMContentLoaded", init);

async function init() {
  setupDataSource();
  state.summaries = await loadProfileSummaries();

  if (!state.summaries.length) {
    state.source = "Local fallback";
    els.dataStatus.textContent = state.source;
    state.summaries = LOCAL_PROFILES.map(toProfileSummary);
  }

  renderProfileOptions(state.summaries);

  els.select.addEventListener("change", () => {
    navigateToProfile(els.select.value);
  });

  els.copyLinkButton.addEventListener("click", copyCurrentLink);

  const username = getRequestedUsername() || state.summaries[0]?.username;
  await showProfile(username);
}

function setupDataSource() {
  const config = window.SUPABASE_CONFIG || {};
  const publicKey = config.publishableKey || config.anonKey;
  const hasSupabase =
    Boolean(config.url) && Boolean(publicKey) && Boolean(window.supabase);

  if (!hasSupabase) {
    state.source = "Local data";
    els.dataStatus.textContent = state.source;
    return;
  }

  state.client = window.supabase.createClient(config.url, publicKey);
  state.source = "Supabase";
  els.dataStatus.textContent = state.source;
}

async function loadProfileSummaries() {
  if (!state.client) {
    return LOCAL_PROFILES.map(toProfileSummary);
  }

  const { data, error } = await state.client
    .from("profiles")
    .select("username, name, title, avatar_url, theme_color")
    .eq("is_published", true)
    .order("created_at", { ascending: true });

  if (error) {
    console.warn("Failed to load Supabase summaries. Falling back locally.", error);
    state.source = "Local fallback";
    els.dataStatus.textContent = state.source;
    return LOCAL_PROFILES.map(toProfileSummary);
  }

  if (!data?.length) {
    console.warn("Supabase returned no published profiles. Falling back locally.");
    state.source = "Local fallback";
    els.dataStatus.textContent = state.source;
    return LOCAL_PROFILES.map(toProfileSummary);
  }

  return data.map(toProfileSummary);
}

async function showProfile(username) {
  setLoading(true);
  setNotFound(false);

  const profile = await loadProfile(username);

  if (!profile) {
    setLoading(false);
    setNotFound(true);
    return;
  }

  state.activeProfile = normalizeProfile(profile);
  renderProfile(state.activeProfile);
  setLoading(false);
  els.shell.hidden = false;
}

async function loadProfile(username) {
  if (!username) return null;

  if (!state.client) {
    return LOCAL_PROFILES.find((profile) => profile.username === username) || null;
  }

  const { data, error } = await state.client
    .from("profiles")
    .select(SELECT_WITH_RELATIONS)
    .eq("username", username)
    .eq("is_published", true)
    .single();

  if (error) {
    console.warn("Failed to load Supabase profile. Falling back locally.", error);
    return LOCAL_PROFILES.find((profile) => profile.username === username) || null;
  }

  return data;
}

function renderProfile(profile) {
  els.root.style.setProperty("--accent", profile.theme_color || "#0f766e");
  document.title = `${profile.name} | 自我介紹`;
  els.select.value = profile.username;

  els.coverImage.src = profile.cover_url || "";
  els.coverImage.alt = profile.cover_url ? `${profile.name} 的封面圖` : "";
  bindImageFallback(els.coverImage);
  els.avatarImage.src = profile.avatar_url || "";
  els.avatarImage.alt = profile.avatar_url ? `${profile.name} 的照片` : "";
  bindImageFallback(els.avatarImage);
  els.avatarFallback.textContent = getInitials(profile.name);

  els.username.textContent = `@${profile.username}`;
  els.name.textContent = profile.name;
  els.title.textContent = profile.title || "自我介紹";
  els.birthday.textContent = profile.birthday ? formatDate(profile.birthday) : "尚未填寫";
  els.location.textContent = profile.location || "尚未填寫";
  els.bio.textContent = profile.bio || "尚未填寫簡介。";

  renderLinks(els.links, profile.profile_links);
  renderHighlights(profile.highlights);
  renderTimeline(els.education, profile.education, renderEducationItem);
  renderTimeline(els.experiences, profile.experiences, renderExperienceItem);
  renderProjects(profile.projects);
  renderSkills(profile.skill_categories);
  renderMoreInfo(profile);
}

function renderProfileOptions(profiles) {
  els.select.textContent = "";

  profiles.forEach((profile) => {
    const option = document.createElement("option");
    option.value = profile.username;
    option.textContent = `${profile.name} / ${profile.username}`;
    els.select.append(option);
  });
}

function renderLinks(container, links) {
  container.textContent = "";
  const sortedLinks = sortByOrder(links);

  if (!sortedLinks.length) {
    appendEmpty(container);
    return;
  }

  sortedLinks.forEach((link) => {
    const anchor = document.createElement("a");
    anchor.href = link.url || "#";
    anchor.target = link.url?.startsWith("http") ? "_blank" : "";
    anchor.rel = link.url?.startsWith("http") ? "noreferrer" : "";
    anchor.textContent = link.label;

    const value = document.createElement("span");
    value.textContent = link.value || "開啟";
    anchor.append(value);
    container.append(anchor);
  });
}

function renderHighlights(highlights) {
  els.highlights.textContent = "";
  const sortedHighlights = sortByOrder(highlights);

  if (!sortedHighlights.length) {
    appendEmpty(els.highlights);
    return;
  }

  sortedHighlights.forEach((item) => {
    const block = document.createElement("div");
    block.className = "highlight-item";

    const value = document.createElement("strong");
    value.textContent = item.value;

    const label = document.createElement("span");
    label.textContent = item.label;

    block.append(value, label);
    els.highlights.append(block);
  });
}

function renderTimeline(container, items, renderer) {
  container.textContent = "";
  const sortedItems = sortByOrder(items);

  if (!sortedItems.length) {
    appendEmpty(container);
    return;
  }

  sortedItems.forEach((item) => container.append(renderer(item)));
}

function renderEducationItem(item) {
  const block = document.createElement("article");
  block.className = "timeline-item";

  const head = document.createElement("div");
  head.className = "item-head";

  const titleBlock = document.createElement("div");
  const title = document.createElement("h3");
  title.textContent = item.school;
  const meta = document.createElement("p");
  meta.className = "item-meta";
  meta.textContent = [item.degree, item.major, item.is_transfer ? "轉學" : ""]
    .filter(Boolean)
    .join(" · ");
  titleBlock.append(title, meta);

  const date = document.createElement("span");
  date.className = "date-pill";
  date.textContent = formatRange(item.start_date, item.end_date, item.is_current);
  head.append(titleBlock, date);

  block.append(head, paragraph(item.description));
  return block;
}

function renderExperienceItem(item) {
  const block = document.createElement("article");
  block.className = "timeline-item";

  const head = document.createElement("div");
  head.className = "item-head";

  const titleBlock = document.createElement("div");
  const title = document.createElement("h3");
  title.textContent = item.role;
  const meta = document.createElement("p");
  meta.className = "item-meta";
  meta.textContent = [item.organization, item.employment_type].filter(Boolean).join(" · ");
  titleBlock.append(title, meta);

  const date = document.createElement("span");
  date.className = "date-pill";
  date.textContent = formatRange(item.start_date, item.end_date, item.is_current);
  head.append(titleBlock, date);

  block.append(head, paragraph(item.description));
  return block;
}

function renderProjects(projects) {
  els.projects.textContent = "";
  const sortedProjects = sortByOrder(projects);

  if (!sortedProjects.length) {
    appendEmpty(els.projects);
    return;
  }

  sortedProjects.forEach((project) => {
    const card = document.createElement("article");
    card.className = "project-card";

    const imageWrap = document.createElement("div");
    imageWrap.className = "project-image";
    const image = document.createElement("img");
    image.src = project.image_url || "";
    image.alt = project.image_url ? `${project.title} 專案圖片` : "";
    bindImageFallback(image);
    imageWrap.append(image);

    const body = document.createElement("div");
    body.className = "project-body";
    const title = document.createElement("h3");
    title.textContent = project.title;
    const meta = document.createElement("p");
    meta.className = "item-meta";
    meta.textContent = [project.role, project.tech_stack].filter(Boolean).join(" · ");

    const tags = document.createElement("div");
    tags.className = "tag-row";
    splitTech(project.tech_stack).forEach((tech) => {
      const tag = document.createElement("span");
      tag.className = "tag";
      tag.textContent = tech;
      tags.append(tag);
    });

    const links = document.createElement("div");
    links.className = "project-links";
    renderLinks(links, project.project_links);

    body.append(title, meta, paragraph(project.description), tags, links);
    card.append(imageWrap, body);
    els.projects.append(card);
  });
}

function renderSkills(groups) {
  els.skills.textContent = "";
  const sortedGroups = sortByOrder(groups);

  if (!sortedGroups.length) {
    appendEmpty(els.skills);
    return;
  }

  sortedGroups.forEach((group) => {
    const block = document.createElement("article");
    block.className = "skill-group";

    const title = document.createElement("h3");
    title.textContent = group.name;

    const list = document.createElement("ul");
    list.className = "skill-list";
    sortByOrder(group.skills).forEach((skill) => {
      const item = document.createElement("li");
      item.textContent = skill.level ? `${skill.name} · ${skill.level}` : skill.name;
      list.append(item);
    });

    block.append(title, list);
    els.skills.append(block);
  });
}

function renderMoreInfo(profile) {
  els.more.textContent = "";
  const blocks = [
    {
      title: "證照",
      items: profile.certifications.map((item) =>
        [item.name, item.issuer, formatDate(item.issued_date)].filter(Boolean).join(" · ")
      )
    },
    {
      title: "獎項",
      items: profile.awards.map((item) =>
        [item.title, item.issuer, formatDate(item.award_date)].filter(Boolean).join(" · ")
      )
    },
    {
      title: "語言",
      items: profile.languages.map((item) =>
        [item.name, item.proficiency].filter(Boolean).join(" · ")
      )
    },
    {
      title: "興趣",
      items: profile.interests.map((item) => item.name)
    }
  ];

  blocks.forEach((block) => {
    const wrapper = document.createElement("article");
    wrapper.className = "info-block";

    const title = document.createElement("h3");
    title.textContent = block.title;
    wrapper.append(title);

    if (!block.items.length) {
      appendEmpty(wrapper);
    } else {
      const list = document.createElement("ul");
      list.className = "plain-list";
      block.items.forEach((text) => {
        const item = document.createElement("li");
        item.textContent = text;
        list.append(item);
      });
      wrapper.append(list);
    }

    els.more.append(wrapper);
  });
}

function normalizeProfile(profile) {
  const links = profile.profile_links || [];
  const highlights = profile.highlights || [];
  const education = profile.education || [];
  const experiences = profile.experiences || [];
  const projects = profile.projects || [];
  const skillCategories = profile.skill_categories || [];
  const certifications = profile.certifications || [];
  const awards = profile.awards || [];
  const languages = profile.languages || [];
  const interests = profile.interests || [];

  return {
    ...profile,
    profile_links: sortByOrder(links),
    highlights: sortByOrder(highlights),
    education: sortByOrder(education),
    experiences: sortByOrder(experiences),
    projects: sortByOrder(projects).map((project) => ({
      ...project,
      project_links: sortByOrder(project.project_links || [])
    })),
    skill_categories: sortByOrder(skillCategories).map((group) => ({
      ...group,
      skills: sortByOrder(group.skills || [])
    })),
    certifications: sortByOrder(certifications),
    awards: sortByOrder(awards),
    languages: sortByOrder(languages),
    interests: sortByOrder(interests)
  };
}

function toProfileSummary(profile) {
  return {
    username: profile.username,
    name: profile.name,
    title: profile.title,
    avatar_url: profile.avatar_url,
    theme_color: profile.theme_color
  };
}

function navigateToProfile(username) {
  const url = new URL(window.location.href);
  url.searchParams.set("u", username);
  window.history.pushState({}, "", url);
  showProfile(username);
}

async function copyCurrentLink() {
  const username = state.activeProfile?.username || els.select.value;
  const url = new URL(window.location.href);
  url.searchParams.set("u", username);

  try {
    await navigator.clipboard.writeText(url.toString());
    flashStatus("已複製");
  } catch {
    flashStatus("複製失敗");
  }
}

function flashStatus(text) {
  const original = els.dataStatus.textContent;
  els.dataStatus.textContent = text;
  window.setTimeout(() => {
    els.dataStatus.textContent = original;
  }, 1200);
}

function getRequestedUsername() {
  const params = new URLSearchParams(window.location.search);
  return params.get("u");
}

function setLoading(isLoading) {
  els.loading.hidden = !isLoading;
  if (isLoading) {
    els.shell.hidden = true;
    els.notFound.hidden = true;
  }
}

function setNotFound(isNotFound) {
  els.notFound.hidden = !isNotFound;
  if (isNotFound) {
    els.shell.hidden = true;
  }
}

function sortByOrder(items = []) {
  return [...items].sort((a, b) => {
    const order = (a.sort_order ?? 0) - (b.sort_order ?? 0);
    if (order !== 0) return order;
    return String(a.name || a.title || a.school || "").localeCompare(
      String(b.name || b.title || b.school || ""),
      "zh-Hant"
    );
  });
}

function appendEmpty(container) {
  const template = document.querySelector("#emptyTemplate");
  container.append(template.content.cloneNode(true));
}

function paragraph(text) {
  const node = document.createElement("p");
  node.className = "item-meta";
  node.textContent = text || "尚未填寫";
  return node;
}

function formatRange(start, end, isCurrent) {
  const startText = formatMonth(start);
  const endText = isCurrent || !end ? "Present" : formatMonth(end);
  return [startText, endText].filter(Boolean).join(" - ");
}

function formatDate(value) {
  if (!value) return "";
  const [year, month, day] = value.split("-");
  if (!year || !month || !day) return value;
  return `${year}/${month}/${day}`;
}

function formatMonth(value) {
  if (!value) return "";
  const [year, month] = value.split("-");
  if (!year || !month) return value;
  return `${year}/${month}`;
}

function getInitials(name = "") {
  return name.trim().slice(0, 2).toUpperCase() || "ID";
}

function splitTech(techStack = "") {
  return techStack
    .split(",")
    .map((item) => item.trim())
    .filter(Boolean);
}

function bindImageFallback(image) {
  image.hidden = !image.getAttribute("src");
  image.onerror = () => {
    image.hidden = true;
    image.removeAttribute("src");
  };
  image.onload = () => {
    image.hidden = false;
  };
}
