#!/bin/bash

TARGET_DIR="/usr/local/tetex/share/texmf/ptex/platex/tetsutex/additional_sty"
SCRIPT_PATH="$TARGET_DIR/auto_update.sh"

echo "=== additional_sty 自動更新セットアップを開始します ==="

# 1. 念のためフォルダへ移動
cd $TARGET_DIR 2>/dev/null
if [ $? -ne 0 ]; then
    echo "エラー: $TARGET_DIR が見つかりません。先に git clone を行ってください。"
    exit 1
fi

# 2. 相手用の auto_update.sh を自動生成（上書き）
echo "自動更新スクリプトを作成中..."
cat << 'EOF' > $SCRIPT_PATH
#!/bin/bash
cd /usr/local/tetex/share/texmf/ptex/platex/tetsutex/additional_sty
LOG_FILE="update_log.txt"

echo "$(date): 更新チェックを開始します..." >> $LOG_FILE
git fetch origin
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    git pull origin main
    echo "$(date): 最新版がみつかったため、自動更新しました。" >> $LOG_FILE
else
    echo "$(date): すでに最新版です。" >> $LOG_FILE
fi
EOF

# 3. 実行権限を付与
chmod +x $SCRIPT_PATH

# 4. crontab への登録（毎週月曜 朝9時）
# 既存の設定を取得（エラーは無視）し、重複登録を防ぎつつ新しい設定を追加
echo "定期スケジュール（毎週月曜朝9時）を登録中..."
CRON_JOB="0 9 * * 1 cd $TARGET_DIR && ./auto_update.sh > /dev/null 2>&1"
(crontab -l 2>/dev/null | grep -v "$TARGET_DIR"; echo "$CRON_JOB") | crontab -

echo "=== セットアップが完了しました！ ==="
echo "毎週月曜日の朝9時に自動で最新版に更新されます（通知はありません）。"
