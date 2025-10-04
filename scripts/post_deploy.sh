#!/usr/bin/env bash

set -euo pipefail
APP_DIR="/var/www/nearweek"
REL_DIR="$APP_DIR/releases"
RELEASE_NAME="${1:?release name required}"
NEW_DIR="$REL_DIR/$RELEASE_NAME"
CURRENT="$APP_DIR/current"

# (if you need shared files — .env, etc.)
mkdir -p "$APP_DIR/shared"

# Switch current -> new release (atomically)
ln -sfn "$NEW_DIR" "$CURRENT"

# Permissions
chown -h deploy:deploy "$CURRENT"
chown -R deploy:deploy "$NEW_DIR"

# Check Nginx configuration
sudo -n /usr/sbin/nginx -t

# Restarting Nginx
sudo -n /usr/bin/systemctl reload nginx

# Rotation: keep 5 releases
cd "$REL_DIR"
ls -1dt */ | tail -n +6 | xargs -r rm -rf
