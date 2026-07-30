#!/bin/bash
set -euxo pipefail

apt-get update -y
apt-get install -y docker.io docker-compose-v2 git

systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu || true

APP_DIR=/opt/${project_name}
if [ ! -d "$APP_DIR" ]; then
  git clone --branch ${git_branch} ${git_repo_url} "$APP_DIR"
else
  cd "$APP_DIR" && git fetch origin ${git_branch} && git reset --hard origin/${git_branch}
fi

cd "$APP_DIR"


cat > .env <<EOF
SHARED_REDIS_HOST=${redis_host}
EOF

docker compose up -d --build