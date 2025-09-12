#!/bin/bash

# الانتقال إلى مجلد المشروع (عدّل المسار إذا لزم الأمر)
cd ~/strapi-cloud-template-blog-bc122c4b4c || exit

# التحقق من وجود src/api
mkdir -p src/api

# نسخ كل ملفات schema من docs/schema إلى المسارات الصحيحة داخل src/api
for schema_file in docs/schema/*.schema.json; do
  # استخراج الاسم الأساسي بدون الامتداد
  base=$(basename "$schema_file" .schema.json)
  
  # مسار الوجهة في Strapi
  target_dir="src/api/$base/content-types/$base"
  mkdir -p "$target_dir"
  
  # نسخ الملف إلى المكان الصحيح باسم schema.json
  cp "$schema_file" "$target_dir/schema.json"
  echo "✅ Copied $schema_file → $target_dir/schema.json"
done

# بناء المشروع وتشغيله
echo "🚀 Running Strapi build and develop..."
npm run build && npm run develop