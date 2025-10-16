#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias grep='grep --color=auto'
alias cd='z'
alias cat='bat --paging=never'
alias ls='eza --git --icons=always'
alias clean='yay -Rns $(pacman -Qtdq); sudo find / -name "*.pacnew" -o -name "*.pacsave" 2>/dev/null'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias shutdown='systemctl poweroff'
alias vim='nvim'
alias ff='fastfetch'
alias update='sudo pacman -Syu && grimaur --git-mirror update'

# better df
duf_compaible_df() {
  if [ "$#" -gt 0 ]; then
    local arg
    local compatible_args=()
    for arg in "$@"; do
      if [[ "$arg" != -* ]]; then
        compatible_args+=("$arg")
      fi
    done
    duf "${compatible_args[@]}"
  else
    duf
  fi
}

alias df='duf_compaible_df'

# Prompt
POSH=agnoster
eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/EDM115-newline.omp.json)"

# Path
export PATH="$PATH:$HOME/.local/bin"

# Defaults
export EDITOR="nvim"
export VISUAL="nvim"

# Fuzzy finder
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source $HOME/Documents/git/fzf/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
  cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
  export | unset) fzf --preview "eval 'echo \${}'" "$@" ;;
  ssh) fzf --preview 'dig {}' "$@" ;;
  *) fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# TheFuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Zoxide
eval "$(zoxide init bash)"
