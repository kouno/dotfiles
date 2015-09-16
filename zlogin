echo "Sourcing ~/.zlogin..."

# User defined variables
[[ -f ~/.zlogin.local  ]] && source ~/.zlogin.local

export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

# Force utf-8 (fixing NERDtree characters)
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
