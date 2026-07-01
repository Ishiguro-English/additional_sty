#!/bin/bash

# 実行時のログを保存する設定
LOG_FILE="update_log.txt"

echo "$(date): 更新チェックを開始します..." >> $LOG_FILE

# GitHubから最新情報を取得
git fetch origin

# ローカルとリモートの差分を確認
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL != $REMOTE ]; then
    git pull origin main
    echo "$(date): 最新版がみつかったため、自動更新しました。" >> $LOG_FILE
else
    echo "$(date): すでに最新版です。" >> $LOG_FILE
fi

