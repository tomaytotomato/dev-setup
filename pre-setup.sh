#!/usr/bin/env bash
set -euo pipefail

echo "==> Ensuring apt prerequisites"
sudo apt update
sudo apt install -y python3 python3-venv python3-pip curl git

VENV="$HOME/.venvs/ansible"
if [ ! -d "$VENV" ]; then
  echo "==> Creating Python venv at $VENV"
  python3 -m venv "$VENV"
fi

# shellcheck disable=SC1091
source "$VENV/bin/activate"
pip install --upgrade pip
pip install -r "$(dirname "$0")/requirements.txt"

echo "==> Installing Ansible collections"
ansible-galaxy collection install -r "$(dirname "$0")/requirements.yml"

cat <<EOF

Bootstrap complete. Activate the venv in this shell with:
  source $VENV/bin/activate

Then run:
  ansible-playbook site.yml -K
EOF
