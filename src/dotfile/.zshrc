# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# -------------------------------------------------
# homebrewのパス
# -------------------------------------------------
export PATH="$PATH:/opt/homebrew/bin"

# -------------------------------------------------
# asdfのパス
# -------------------------------------------------
. "$(brew --prefix asdf)/libexec/asdf.sh"

# -------------------------------------------------
# direnvのパス
# -------------------------------------------------
eval "$(direnv hook zsh)"

# -------------------------------------------------
# AndroidStudioのパス
# -------------------------------------------------
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# -------------------------------------------------
# Docker Desktopのパス
# https://eshlox.net/2023/02/26/supabase-cli-cannot-connect-to-the-docker-daemon
# -------------------------------------------------
export DOCKER_HOST=unix://"$HOME/.docker/run/docker.sock"

# -------------------------------------------------
# Starshipのパス
# -------------------------------------------------
eval "$(starship init zsh)"

# -------------------------------------------------
# Figのパス
# -------------------------------------------------
export PATH="$PATH:~/.local/bin"
export PATH="$PATH:~/.fig/bin"

# -------------------------------------------------
# Zinit
# -------------------------------------------------
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# -------------------------------------------------
# コマンドのエイリアス
# -------------------------------------------------
alias vim='nvim'

# -------------------------------------------------
# コマンドの履歴の設定
# -------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups

# -------------------------------------------------
# プラグイン
# -------------------------------------------------
zinit ice depth=1

# 補完
zinit light zsh-users/zsh-autosuggestions

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word

# 過去に移動したことのあるディレクトリ名を指定して移動
zinit load agkozak/zsh-z

# 親ディレクトリへ移動
zinit load Tarrasch/zsh-bd

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
