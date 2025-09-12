#!/bin/bash

# الانتقال إلى مجلد المشروع (عدّل المسار إذا لزم الأمر)
cd ~/strapi-cloud-template-blog-bc122c4b4c || exit

# إنشاء مجلد schema داخل docs إن لم يكن موجود
mkdir -p docs/schema

# 1. Articles
cat > docs/schema/articles.schema.json <<'EOF'
{
  "kind": "collectionType",
  "collectionName": "articles",
  "info": {
    "singularName": "article",
    "pluralName": "articles",
    "displayName": "Articles"
  },
  "options": { "draftAndPublish": true },
  "attributes": {
    "title": { "type": "string", "required": true },
    "content": { "type": "richtext" },
    "cover_image": { "type": "media", "multiple": false },
    "author": { "type": "relation", "relation": "manyToOne", "target": "api::author.author" },
    "category": { "type": "relation", "relation": "manyToOne", "target": "api::category.category" },
    "publishedAt": { "type": "datetime" }
  }
}
EOF

# 2. Categories
cat > docs/schema/categories.schema.json <<'EOF'
{
  "kind": "collectionType",
  "collectionName": "categories",
  "info": {
    "singularName": "category",
    "pluralName": "categories",
    "displayName": "Categories"
  },
  "options": { "draftAndPublish": true },
  "attributes": {
    "name": { "type": "string", "required": true },
    "description": { "type": "text" },
    "icon": { "type": "media", "multiple": false }
  }
}
EOF

# 3. Authors
cat > docs/schema/authors.schema.json <<'EOF'
{
  "kind": "collectionType",
  "collectionName": "authors",
  "info": {
    "singularName": "author",
    "pluralName": "authors",
    "displayName": "Authors"
  },
  "options": { "draftAndPublish": true },
  "attributes": {
    "name": { "type": "string", "required": true },
    "bio": { "type": "text" },
    "avatar": { "type": "media", "multiple": false },
    "social_links": { "type": "json" }
  }
}
EOF

# 4. Places
cat > docs/schema/places.schema.json <<'EOF'
{
  "kind": "collectionType",
  "collectionName": "places",
  "info": {
    "singularName": "place",
    "pluralName": "places",
    "displayName": "Places"
  },
  "options": { "draftAndPublish": true },
  "attributes": {
    "name": { "type": "string", "required": true },
    "description": { "type": "text" },
    "location": { "type": "json" },
    "images": { "type": "media", "multiple": true }
  }
}
EOF

# 5. Events
cat > docs/schema/events.schema.json <<'EOF'
{
  "kind": "collectionType",
  "collectionName": "events",
  "info": {
    "singularName": "event",
    "pluralName": "events",
    "displayName": "Events"
  },
  "options": { "draftAndPublish": true },
  "attributes": {
    "title": { "type": "string", "required": true },
    "description": { "type": "richtext" },
    "date": { "type": "date" },
    "place": { "type": "relation", "relation": "manyToOne", "target": "api::place.place" },
    "images": { "type": "media", "multiple": true }
  }
}
EOF

echo "✅ تم إنشاء ملفات schema.json بنجاح في docs/schema/"