# Aliases
# forked from https://github.com/mathiasbynens/dotfiles

# Neovim
alias n=nvim

# Cargo
alias c=cargo

# eza
alias ls=eza
alias l=eza

# kitty
alias icat='kitty +kitten icat'
alias hg='kitty +kitten hyperlinked_grep'

# Less
alias L=less

# Tree Grepper
alias tg=tree-grepper

# Python
alias p3=python3

# Git
alias g='git'
alias gp='git push'
alias gpf='git push --force-with-lease'

function git-rm-pruned
  awk '{ gsub(/origin\//, "", $3); print $3 }' | xargs git branch -D
end

# ANSI
alias strip-ansi="perl -pe 's/\e\[[0-9;]*m(?:\e\[K)?//g'"

# tree
alias tree='tree -C'

# Commands
alias flushdns='dscacheutil -flushcache'
alias ctime="date '+%s'"
alias untgz="tar -xzvf"

# Unformat text
alias unformat='pbpaste | pbcopy'

# Light theme for bat
alias lbat='bat --theme "Solarized (light)"'


# Shortcuts
alias h="history"
alias j="jobs"
alias o="open"
alias oo="open ."
alias tac="tail -r"

function md
  mkdir -p "$argv[1]" && cd "$argv[1]"
end

# Bundler
alias be='bundle exec'

# OS X has no `md5sum`, so use `md5` as a fallback
alias md5sum="md5"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Top
alias top="top -o cpu"

# File size
alias fs="stat -c \"%s bytes\""

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# if [ -f /usr/local/bin/trash ]; then alias rm="/usr/local/bin/trash"; fi

# Empty the Trash main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl;"

# http://stackoverflow.com/questions/4422491/how-do-i-trim-lines-read-from-standard-input-on-bash
function trim
  read -r line
  echo "$line"
end

# AnyBar
function anybar
  echo -n $argv[1] | nc -4u -w0 localhost (set -q argv[2]; or echo 1738)
end


# Meow
alias 🐱=cat

# https://gist.github.com/rickycodes/49b300476ed8532e910d
function idk
  set shrug '¯\_(ツ)_/¯'
  echo $shrug | pbcopy; and echo "$shrug copied to clipboard"
end

# sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent';
# echo ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV*

# PostgreSQL
alias postgres-start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres-stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# H2
alias h2browser="java -cp ~/.ivy2/cache/com.h2database/h2/jars/h2-1.3.175.jar org.h2.tools.Server -web"

# Docker
# alias docker-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias docker-ip="docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

function docker-psi
  begin
    echo 'CONTAINER ID|IMAGE|COMMAND|CREATED|STATUS|IP|PORTS|NAMES';
    # truncating Id to 12 chars is docker ps default
    # truncating StartedAt to 19 gives seconds resolution: "2016-11-15T12:57:56"
    # space before `{{end}}` intentional, to separate if you have multiple networks with IP(?)
    docker ps --quiet "$argv" | xargs docker inspect --format='{{printf "%.12s" .Id}}|{{.Config.Image}}|{{.Config.Cmd}}|{{printf "%.19s" .State.StartedAt}}|{{.State.Status}}|{{range $net, $conf := .NetworkSettings.Networks}}{{$net}}:{{$conf.IPAddress}} {{end}}|{{.NetworkSettings.Ports}}|{{.Name}}'
  end | column -t -s '|'
end

# Java
# http://superuser.com/a/568016

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home | sort | uniq'

function setjdk
    if test (count $argv) -ne 0
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
        if test -n "$JAVA_HOME"
            removeFromPath $JAVA_HOME
        end
        set -x JAVA_HOME (/usr/libexec/java_home -v $argv)
        set -x PATH $JAVA_HOME/bin $PATH
    end
    echo "JAVA_HOME set to $JAVA_HOME"
    java -version

  function removeFromPath
    export PATH=$(echo $PATH | sed -E -e "s;:$argv[1];;" -e "s;$argv[1]:?;;")
  end
end

function mirror-site
  nice wget \
     --mirror \
     --no-verbose \
     --execute robots=off \
     --page-requisites \
     --adjust-extension \
     --convert-links \
     --span-hosts \
     --no-parent \
     --warc-file "$argv[1]" \
     --domains "$argv[1]" \
     "$argv[2]"
end

alias ghci-pretty='stack ghci --ghci-options "-interactive-print=Text.Pretty.Simple.pPrint" --package pretty-simple'

alias ghci-core="stack ghci --ghci-options '-ddump-simpl -dsuppress-idinfo -dsuppress-coercions -dsuppress-type-applications -dsuppress-uniques -dsuppress-module-prefixes'"

function compress
  mogrify \
    -filter Triangle \
    -define filter:support=2 \
    -thumbnail 900 \
    -unsharp 0.25x0.25+8+0.065 \
    -dither None \
    -posterize 136 \
    -quality 82 \
    -define jpeg:fancy-upsampling=off \
    -define png:compression-filter=5 \
    -define png:compression-level=9 \
    -define png:compression-strategy=1 \
    -define png:exclude-chunk=all \
    -interlace none \
    -colorspace sRGB \
    -format jpg \
    -strip \
    $argv
end

function rdoc
  open "https://docs.rs/$argv[1]"
end

function sdoc
  open "https://std.rs/$argv[1]"
end

function listening
  switch (count $argv)
      case 0
          sudo lsof -iTCP -sTCP:LISTEN -n -P
      case 1
          sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $argv[1]
      case '*'
          echo "Usage: listening [pattern]"
  end
end

function sigusr1
  ps aux | rg "$argv[1]" | awk '{ print $2 }' | head -n1 | xargs -I{} kill -SIGUSR1 {}
end

function sighup
  ps aux | rg "$argv[1]" | awk '{ print $2 }' | head -n1 | xargs -I{} kill -SIGHUP {}
end

alias hermes='cargo run --'
alias chainpulse='~/.cargo/target/chainpulse'

alias flip="echo \"\n\n\n\n(╯°□°）╯︵ ┻━┻\n\n\n\n\"" 

function gpt-summary
  set COMMIT_MSG_FILE $(mktemp /tmp/gpt-commit-msg.XXXXXX)
  gptcommit prepare-commit-msg --commit-msg-file "$COMMIT_MSG_FILE" --commit-source ''
  cat "$COMMIT_MSG_FILE"
  rm -f "$COMMIT_MSG_FILE"
end

function dexec
    # Grab the container name and use fzf to let us pick it
    set result $(docker container ls --format "{{.Names}}" | fzf --reverse)

    # Abort if result is empty
    if test -z "$result"
      echo "No container selected"
      return
    end

    # No command - try bash
    if test (count $argv) -eq 0
      echo "docker exec -it $result /bin/bash"
      docker exec -it "$result" /bin/bash
    end

    # Command was given so use that 
    if test (count $argv) -eq 1
      echo "docker exec -it $result $argv[1]"
      docker exec -it "$result" "$argv[1]"
    end
  end

alias confetti 'open raycast://confetti'

function preview_fzf
  fzf --preview='bat --style numbers,changes --color=always {} | head -n $LINES'
end

alias ls! preview_fzf

function pimount
  sudo mkdir /Volumes/Pi
  sudo mount -t nfs -o resvport,rw pi.local:/media/hideo /Volumes/Pi
end

function narrow_menubar
  defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
  defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6
end
