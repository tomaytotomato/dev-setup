#!/usr/bin/env bash
set -euo pipefail

echo "==> Refreshing hblock domain blocklists"
if command -v hblock >/dev/null 2>&1; then
  sudo hblock -H /etc/hosts.allow -F /etc/hosts.deny
else
  echo "hblock not installed; skipping"
fi

if ! command -v brew >/dev/null 2>&1 && [ ! -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  echo "==> Installing LinuxBrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  BASHRC="$HOME/.bashrc"
  BREW_LINE='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
  grep -qxF "$BREW_LINE" "$BASHRC" || printf '\n%s\n' "$BREW_LINE" >> "$BASHRC"
else
  echo "LinuxBrew already installed; skipping"
fi

if [ -x /opt/jetbrains-toolbox ]; then
  echo "==> First-run JetBrains Toolbox (close the window when it appears)"
  /opt/jetbrains-toolbox &
fi
