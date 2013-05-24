# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="blinks"

# aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

# Oh My ZSH!
source $ZSH/oh-my-zsh.sh

MY_PATH=~/bin
MY_PATH=$MY_PATH:/usr/local/share/npm/bin # NPM
MY_PATH=$MY_PATH:/usr/local/texlive/2012/bin/x86_64-darwin # MacTeX 2012
MY_PATH=$MY_PATH:/usr/local/rock/bin:/usr/local/ooc/bin # ooc

# Homebrew
MY_PATH=$MY_PATH:/usr/local/bin
MY_PATH=$MY_PATH:/usr/local/sbin

# Python
MY_PATH=$MY_PATH:/usr/local/share/python

# Extend PATH
export PATH=$MY_PATH:$PATH

# Node modules path
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# Rock distribution path
export ROCK_DIST=/usr/local/rock
export OOC_LIBS=/usr/local/ooc

# Editors
export EDITOR="subl -w -n"
export VISUAL=$EDITOR
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export GEM_OPEN_EDITOR=$EDITOR

. /usr/local/Cellar/git/1.8.0/etc/bash_completion.d/git-prompt.sh

# Command prompt
export PROMPT=' %{$fg_bold[red]%}λ %{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# export RPROMPT='%n@%m | %*'

# UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
. ~/.aliases

# RVM
. ~/.rvm/scripts/rvm

# Z
. `brew --prefix`/etc/profile.d/z.sh

# GRC
# . "`brew --prefix`/etc/grc.bashrc"

# Disable Homebrew Emoji
export HOMEBREW_NO_EMOJI=1
