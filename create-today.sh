#!/bin/bash

# スクリプトのディレクトリに移動
cd "$(dirname "$0")"

# 今日の日付を取得
DATE_FILENAME=$(date +%Y%m%d)
DATE_DISPLAY=$(date +%Y-%m-%d)

# 出力ファイルパス（notesサブディレクトリ）
OUTPUT_FILE="notes/${DATE_FILENAME}.md"

# ファイルが既に存在するかチェック
if [ -f "$OUTPUT_FILE" ]; then
    echo "エラー: ${OUTPUT_FILE} は既に存在します"
    exit 1
fi

# テンプレートファイルが存在するかチェック
if [ ! -f "template.md" ]; then
    echo "エラー: template.md が見つかりません"
    exit 1
fi

# テンプレートから新しいファイルを作成し、日付を置換
sed "s/YYYY-MM-DD/${DATE_DISPLAY}/g" template.md > "$OUTPUT_FILE"

echo "✓ $(basename "$OUTPUT_FILE") を notes/ に作成しました"
