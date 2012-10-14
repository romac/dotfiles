# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# aliases
alias zshconfig="choc ~/.zshrc"
alias ohmyzsh="choc ~/.oh-my-zsh"

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
plugins=(git)

# Oh My ZSH!
source $ZSH/oh-my-zsh.sh

MY_PATH=
MY_PATH=$MY_PATH:/usr/local/share/npm/bin # NPM
MY_PATH=$MY_PATH:/usr/local/texlive/2012/bin/x86_64-darwin # MacTeX 2012
MY_PATH=$MY_PATH:/usr/local/rock/bin # Rock

# Homebrew
MY_PATH=$MY_PATH:/usr/local/bin
MY_PATH=$MY_PATH:/usr/local/sbin

# Add RVM to PATH for scripting
MY_PATH=$MY_PATH:$HOME/.rvm/bin

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
export PROMPT='%{$fg_bold[red]%}λ %{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
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

