# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::ubuntu
zinit snippet OMZP::node
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::brew
zinit snippet OMZP::docker-compose

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
bindkey '^[[1~' beginning-of-line  # Home key
bindkey '^[[4~' end-of-line  # End key
bindkey '^[[3~' delete-char  # Delete key
bindkey '^[[Z' autosuggest-accept
bindkey "^[[H" beginning-of-line  # Home key
bindkey "^[[F" end-of-line        # End key

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias vim='nvim'
alias c='clear'
alias fzf='/usr/bin/fzf --preview "bat --style=numbers --color=always --line-range :500 {}; \fi" --preview-window=right:50%'
alias e='exit'
alias bc='better-commits'
alias cat="bat"
alias ls='eza --long --icons=always --git --no-time --no-user --no-permissions'
alias nv="nvim"
alias lg="lazygit"

# Include additional paths
export PATH="$HOME/.local/bin:/opt/nvim-linux64/bin:$PATH"

# pnpm
export PNPM_HOME="/home/shahid/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Shell integrations
eval "$(zoxide init zsh)"
alias cd='z'

# Function to combine zoxide and fzf for directory navigation
zfd() {
  local dir
  dir=$(zoxide list | fzf --preview 'ls -l {}' --preview-window=up:30%:hidden --height=20)
  if [[ -n $dir ]]; then
    cd "$dir"
  fi
eval "$(zoxide init zsh)"
alias cd='z'
}

# FZF default options
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Alias for 'the fuck' command
eval $(thefuck --alias fk)

# Add Arch Linux specific settings
# - Ensure Arch's package manager is updated and use AUR for additional packages
alias pacu="sudo pacman -Syu"  # Update all packages
alias yayu="yay -Syu"          # Update all packages including AUR
