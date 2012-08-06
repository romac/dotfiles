
# Paths
export PATH=~/bin:/usr/local/bin:$PATH

# Editors
export EDITOR="choc -w"
export VISUAL=$EDITOR
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export GEM_OPEN_EDITOR=$EDITOR

# _PS1()
# {
#     local PRE= NAME="$1" LENGTH="$2";
#     [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
#         PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
#     ((${#NAME}>$LENGTH)) && NAME="/...${NAME:$[${#NAME}-LENGTH+4]}";
#     echo "$PRE$NAME"
# }
# export PS1='\u @ \h in \[\033[01;37m\]$(_PS1 "$PWD" 30)\[\033[00;35m\]$(__git_ps1)\[\033[00m\] \$ '

export PS1='%{$fg_bold[red]%}λ %{$fg_bold[green]%}%p %{$fg_bold[blue]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# Aliases
source ~/.aliases

# UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Node
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# RVM
source ~/.rvm/scripts/rvm