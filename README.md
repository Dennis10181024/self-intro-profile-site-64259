# 自我介紹網站開發

這是一個可連接 Supabase PostgreSQL 的多人自我介紹網站。每個人只要在資料庫有一筆 `profiles.username`，就能共用同一份頁面模板：

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/Dennis10181024/self-intro-profile-site)

- `index.html?u=xuyizhan`
- `index.html?u=chen-xiao-ming`

## 檔案

- `index.html`：網站主頁與模板結構
- `assets/styles.css`：版面與視覺設計
- `assets/app.js`：讀取 Supabase 或本機假資料並渲染頁面
- `assets/config.js`：Supabase 連線設定
- `database/schema.sql`：關聯式資料庫結構與 RLS 公開讀取規則
- `database/seed.sql`：兩位使用者的初始測試資料

## 資料庫部署

1. 到 Supabase 建立新專案。
2. 開啟 SQL Editor。
3. 先執行 `database/schema.sql`。
4. 再執行 `database/seed.sql`。
5. 到 Project Settings / API Keys 複製 Project URL 和 publishable key。
6. 編輯 `assets/config.js`：

```js
window.SUPABASE_CONFIG = {
  url: "https://你的專案.supabase.co",
  publishableKey: "sb_publishable_你的key",
  anonKey: "你的 anon public key"
};
```

不要把 `service_role` 或 secret key 放進前端，前端只能使用 publishable key 或 anon key。

## 正式上線

完整部署步驟請看 `DEPLOY.md`。這個專案可以直接部署到 Netlify 或 GitHub Pages，不需要 build 指令。

## 新增更多人的頁面

新增一個人時，在 `profiles` 新增主資料，並在其他表用 `profile_id` 關聯：

- `profile_links`：Email、GitHub、LinkedIn、個人網站等
- `highlights`：首頁重點數字或短句
- `education`：學歷
- `experiences`：經歷
- `projects` 與 `project_links`：專案與專案連結
- `skill_categories` 與 `skills`：技能分類與技能
- `certifications`：證照
- `awards`：獎項
- `languages`：語言能力
- `interests`：興趣或研究方向

只要 `profiles.is_published = TRUE`，網址就能用 `index.html?u=你的username` 開啟。

最快方式是複製 `database/add-profile-template.sql`，改成朋友的資料，然後貼到 Supabase SQL Editor 執行。
