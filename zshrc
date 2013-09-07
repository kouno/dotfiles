# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  brew
  gem
  git-extras
  git-remote-branch
  go
  osx
  tmuxinator
  vagrant
  vi-mode
  vundle
  rails
  rails3
  rails4
  rvm
  zeus
)

source $ZSH/oh-my-zsh.sh

##
## Welcoming message. Customize it as needed.
##

# Update paths
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

# Aliases
alias ls='ls -G'
alias ll='ls -hl'
alias la='ls -la'
alias grep='grep --colour=auto'
alias mkdir='mkdir -p'

# git
alias g="git"
alias gci="git pull --rebase && rake && git push"

# Bundler
alias b="bundle"

# Tests and Specs
alias t="ruby -I test"
alias s="rspec"
alias cuc="cucumber"

# Rubygems
alias gi="gem install"
alias giv="gem install -v"

# MacVim
alias mvim="mvim -v"

alias whats-my-ip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Editor for bundler
export BUNDLER_EDITOR=vim

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst""""""""""""""""""""""

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# zsh
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Don't autocomplete anymore
unsetopt CORRECT_ALL

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export EDITOR='vim'

# Force utf-8 (fixing NERDtree characters)
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
