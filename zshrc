##
## Welcoming message. Customize it as needed.
##

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.

setopt promptsubst

# Load the prompt theme system
autoload -U promptinit
autoload -U compinit && compinit
promptinit

# Use the wunjo prompt theme
prompt wunjo

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
