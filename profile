
MY_PATH=~/bin # My own commands
MY_PATH=$MY_PATH:/usr/local/share/npm/bin # NPM
MY_PATH=$MY_PATH:/usr/local/texlive/2012/bin/x86_64-darwin # MacTeX 2012
MY_PATH=$MY_PATH:/usr/local/rock/bin # Rock

# Homebrew
MY_PATH=$MY_PATH:/usr/local/bin
MY_PATH=$MY_PATH:/usr/local/sbin

# Extend PATH
export PATH=$MY_PATH:$PATH

# Node modules path
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# Rock distribution path
export ROCK_DIST=/usr/local/rock

# Editors
export EDITOR="subl"
export VISUAL=$EDITOR
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export GEM_OPEN_EDITOR=$EDITOR

# Command prompt
export PROMPT='%{$fg_bold[red]%}λ %{$fg_bold[green]%}%p %{$fg_bold[blue]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
export RPROMPT='%n@%m | %*'

# UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
source ~/.aliases

# RVM
source ~/.rvm/scripts/rvm

# Z
source ~/bin/z.sh

# GRC
# . "`brew --prefix`/etc/grc.bashrc"
