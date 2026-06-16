#!/usr/bin/env bash
set -euo pipefail
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1) Symlink configs (back up existing real files first)
mkdir -p "$HOME/.dotfiles-backup"
for f in .vimrc .vim .tmux.conf .dir_colors; do
  if [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ]; then mv "$HOME/$f" "$HOME/.dotfiles-backup/"; fi
  ln -sfn "$DOTFILES/$f" "$HOME/$f"
done

# 2) Install custom scripts into ~/.local/bin
mkdir -p "$HOME/.local/bin"
install -m 0755 "$DOTFILES"/tmux-* "$HOME/.local/bin/"

# 3) tmux plugins via tpm (re-clone if the dir exists but is incomplete)
if [ ! -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
  rm -rf "$HOME/.tmux/plugins/tpm"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

# 4) vim plugins via vim-plug (--sync so the install finishes headless)
command -v vim >/dev/null && vim +'PlugInstall --sync' +qall || true

# 5) Dependency / PATH checks
for c in tmux git fzf vim; do command -v "$c" >/dev/null || echo "missing: $c"; done
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "warning: ~/.local/bin not in PATH" ;;
esac
tmux -V
