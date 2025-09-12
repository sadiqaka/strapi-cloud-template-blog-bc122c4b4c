# Phase 1: Content Collections (Strapi v5)

## 📚 Collections to Create

### 1. Articles (مقالات)
- title (string, required)
- content (richtext / wysiwyg)
- cover_image (media, single)
- author (relation → Authors, many-to-one)
- category (relation → Categories, many-to-one)
- publishedAt (datetime)

### 2. Categories (تصنيفات)
- name (string, required)
- description (text, optional)
- icon (media, single)

### 3. Authors (كتّاب)
- name (string, required)
- bio (text, optional)
- avatar (media, single)
- social_links (JSON or repeatable component)

### 4. Places (أماكن)
- name (string, required)
- description (text)
- location (string or JSON for coordinates)
- images (media, multiple)

### 5. Events (فعاليات)
- title (string, required)
- description (richtext)
- date (date)
- place (relation → Places, many-to-one)
- images (media, multiple)

---

## 🔗 Relations
- Article ↔ Category (many-to-one)
- Article ↔ Author (many-to-one)
- Event ↔ Place (many-to-one)