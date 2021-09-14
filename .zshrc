# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ==================================
## Zinit
# ==================================
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

eval "$(starship init zsh)"
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit light zdharma/fast-syntax-highlighting
zinit light paulirish/git-open
zinit light starship/starship


autoload -Uz compinit ; compinit
setopt auto_cd
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

setopt share_history
setopt brace_ccl
setopt extended_glob
setopt print_eight_bit
setopt always_last_prompt
setopt complete_in_word
setopt magic_equal_subst
setopt interactive_comments
setopt auto_param_keys
setopt auto_menu
setopt list_types
setopt auto_param_slash
setopt mark_dirs
setopt nonomatch
autoload colors

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000000
export SAVEHIST=100000000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# zsh
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^U" backward-kill-line
bindkey "^K" backward-kill-line
bindkey "^H" backward-word
bindkey -e
bindkey '\e[3~' delete-char

# Path to your oh-my-zsh installation.
export ZSH="/Users/otsuboshunya/.oh-my-zsh"

ZSH_THEME="cobalt2"
DEFAULT_USER=`whoami`

plugins=(
  git zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# aliases

alias dk='docker'
alias dkc='docker-compose'
alias dkcd="docker-compose down"
alias dkcu="docker-compose up"
alias dkcub="docker-compose up --build"
alias dkcud="docker-compose up -d"
alias dkps="docker ps"

alias ga="git add ."
alias gaa="git add ."
alias gaaa="git add ."

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# new_line
function precmd() {
  # Print a newline before the prompt, unless it's the
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
      NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
      echo ""
  fi
}

function dm(){
  file=$HOME/.dm.txt
  touch $file

  if [[ $1 = "a" ]]; then
    dir=`/bin/pwd`
    echo -n added:
    echo $dir | tee -a $file
    return
  fi

  if [[ $1 = "e" ]]; then
    vim $file
    return
  fi

  t=`cat $file | fzf`
  if [[ $t = "" ]]; then
    return
  fi

  cd $t
  echo
}

zle -N dm
bindkey "^o" dm


# mkdir then cd
function _makedir_then_changedir(){
  dir=$1
  mkdir -p $dir
  cd $dir
}
alias mcdir='_makedir_then_changedir'

alias co='
  git branch -a | \
    sed -e "s/[ ,\*]//g" |\
    sed -e "s/remotes\/origin\///g" |\
    sed -e "s/HEAD->//g" |\
    sort -u |\
    fzf |\
    tr -d "\n" |\
    xargs git checkout
    '

export FZF_DEFAULT_OPTS='--height 40% --border'
