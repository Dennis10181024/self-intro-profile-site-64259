# 正式上線流程

這個專案是純前端靜態網站，資料庫使用 Supabase PostgreSQL。正式上線分成兩件事：

1. 建立 Supabase 雲端資料庫
2. 把網站檔案部署到靜態網站平台

## 1. 建立 Supabase 資料庫

1. 到 Supabase 建立 Project。
2. 開啟 SQL Editor。
3. 執行 `database/schema.sql`。
4. 執行 `database/seed.sql`。
5. 到 Project Settings / API Keys，複製：
   - Project URL
   - Publishable key
6. 修改 `assets/config.js`：

```js
window.SUPABASE_CONFIG = {
  url: "https://你的專案.supabase.co",
  publishableKey: "sb_publishable_你的key",
  anonKey: ""
};
```

前端只能放 publishable key 或 anon key。不要把 secret key 或 service_role key 放進網站。

## 2. 推薦部署方式：Netlify

Netlify 很適合這個專案，因為不需要 build 指令，也不需要後端伺服器。

### 方法 A：手動上傳

1. 登入 Netlify。
2. 建立新專案。
3. 選擇手動部署或拖曳資料夾部署。
4. 上傳整個專案資料夾：

```text
C:\Users\Denni\Desktop\自我介紹網站開發
```

5. 發布後會得到類似這樣的網址：

```text
https://your-site-name.netlify.app
```

6. 測試：

```text
https://your-site-name.netlify.app/index.html?u=xuyizhan
https://your-site-name.netlify.app/index.html?u=chen-xiao-ming
```

### 方法 B：GitHub + Netlify 自動部署

1. 把這個資料夾上傳到 GitHub repository。
2. 在 Netlify 建立新專案，連接該 repository。
3. Build command 留空。
4. Publish directory 填：

```text
.
```

5. 之後每次更新 GitHub，Netlify 會自動重新部署。

## 3. 備用部署方式：GitHub Pages

如果你想免費且簡單，也可以用 GitHub Pages：

1. 建立 GitHub repository。
2. 上傳整個專案。
3. 到 repository Settings / Pages。
4. Source 選擇 `Deploy from a branch`。
5. Branch 選 `main`，資料夾選 `/root`。
6. 網址會類似：

```text
https://你的帳號.github.io/你的repo名稱/
```

人物頁面：

```text
https://你的帳號.github.io/你的repo名稱/index.html?u=xuyizhan
```

## 4. 正式上線檢查表

- `assets/config.js` 已填 Supabase URL 和 publishable key。
- Supabase 已執行 `schema.sql` 和 `seed.sql`。
- Supabase RLS 已啟用，公開頁面只能讀取 `is_published = TRUE` 的資料。
- 網站上線後可打開 `index.html?u=xuyizhan`。
- 不要提交或公開 Supabase secret key / service_role key。
- 如果要綁定自己的網域，到 Netlify 或 GitHub Pages 的 Domain settings 設定。
