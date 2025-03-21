#!/bin/bash

# Server ishga tushayotganini bildiruvchi log
echo "🔄 Starting Minecraft Bedrock Server..."
echo "✅ Version: 1.20.71.01"

# Agar `permissions.json` mavjud bo‘lmasa, yangi fayl yaratamiz
if [ ! -f "permissions.json" ]; then
    echo "⚠️ OP huquqlari fayli topilmadi, yangisini yaratamiz..."
    echo '[{"permission": "operator", "name": "MultiMax14643"}]' > permissions.json
else
    echo "🛠️ OP fayli mavjud, o‘zgartirilmaydi."
fi

# Bedrock serverni ishga tushiramiz
LD_LIBRARY_PATH=. ./bedrock_server
