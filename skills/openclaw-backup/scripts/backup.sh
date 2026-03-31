#!/bin/bash
# OpenClaw Backup Script with BDpan Upload
# Usage: ./backup.sh

BACKUP_DIR="$HOME/openclaw-backups"
REMOTE_DIR="backup"
DATE=$(date +%Y-%m-%d_%H%M)
BACKUP_FILE="$BACKUP_DIR/openclaw-usa-$DATE.tar.gz"
MAX_REMOTE=30

mkdir -p "$BACKUP_DIR"

# Create backup (exclude completions cache and logs)
tar -czf "$BACKUP_FILE" \
    --exclude='completions' \
    --exclude='*.log' \
    -C "$HOME" .openclaw/ 2>/dev/null

if [ $? -eq 0 ]; then
    SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    
    # Upload to bdpan
    echo "📤 Uploading to Baidu Yun..."
    bdpan upload "$BACKUP_FILE" "$REMOTE_DIR/openclaw-usa-$DATE.tar.gz"
    
    if [ $? -eq 0 ]; then
        echo "✅ Uploaded: $REMOTE_DIR/openclaw-usa-$DATE.tar.gz ($SIZE)"
        
        # Rotate remote: keep only last MAX_REMOTE backups
        echo "🧹 Rotating remote backups (keep latest $MAX_REMOTE)..."
        REMOTE_LIST=$(bdpan ls "$REMOTE_DIR" --json 2>/dev/null | python3 -c "
import json,sys
items = json.load(sys.stdin)
backups = [f for f in items if not f.get('isdir') and f.get('server_filename','').startswith('openclaw-usa-') and f.get('server_filename','').endswith('.tar.gz')]
backups.sort(key=lambda x: x.get('server_mtime',''))
for f in backups[:-30]:
    print(f['path'])
" 2>/dev/null)
        
        if [ -n "$REMOTE_LIST" ]; then
            echo "$REMOTE_LIST" | while read -r filepath; do
                echo "🗑️  Deleting remote: $filepath"
                bdpan rm "$filepath" 2>/dev/null
            done
        else
            echo "✅ No rotation needed"
        fi
        
        # No local retention - cloud only
        echo "☁️ Local retention disabled - cloud backup only"
        exit 0
    else
        echo "❌ Upload to bdpan failed"
        exit 1
    fi
else
    echo "❌ Backup creation failed"
    exit 1
fi
