export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
export EDITOR="emacs"
export HISTFILESIZE=4096
export HISTIGNORE="cd:date:exit:la:ls:pwd"
export HISTSIZE=4096
export SAVEHIST=4096
export HISTCONTROL=ignoreboth
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GREP_OPTIONS="--color=auto"
export TERM="xterm-256color"

export NODE_ENV=development

export DEFAULT_USER=rockymadden
export DISABLE_AUTO_TITLE="false"
export DISABLE_AUTO_UPDATE="true"
export HIST_STAMPS="yyyy-mm-dd"
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history background_jobs time)
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
export POWERLEVEL9K_STATUS_VERBOSE=true
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(autojump)
source "${ZSH}/oh-my-zsh.sh"

alias sudo='sudo env PATH=$PATH'
eval "$(hub alias -s)"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias -- -='cd -'
alias aliases='grep alias < ~/.aliases | cut -c 7- | sort'
alias await='f() { eval "until ${1}; do sleep ${2-10}; done"; }; f'
alias decrypt='openssl aes-256-cbc -d -a'
alias dotfiles-upgrade='f() { curl -fsSL https://raw.githubusercontent.com/rockymadden/dotfiles-ubuntu/master/bin/upgrade | bash }; f'
alias download='aria2c'
alias encrypt='openssl aes-256-cbc -a -salt'
alias g='git'
alias gcm='git cm'
alias gco='git co'
alias gd='git done'
alias ge='git eject'
alias gf='git feature'
alias gg='git graph'
# alias gla='git la'
# alias gls='git ls'
alias gp='git push origin -u $(git rev-parse --abbrev-ref HEAD)'
alias gpa="gp && await 'git ci-status'"
alias gpn='f() { gp && { sleep 10 ; circleci notify; } &; }; f'
alias gpg-decrypt-asymmetric='gpg'
alias gpg-decrypt-symmetric='gpg -d'
alias gpg-encrypt-asymmetric='gpg -e -r'
alias gpg-encrypt-symmetric='gpg -c'
alias gr='git rollback'
alias gs='git status'
alias gu='git undo'
alias h='history'
alias hg='f() { history | grep "$*"; }; f'
alias http-dump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias http-sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias ip-wan="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip-lan="ipconfig getifaddr en0"
alias ip-all="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias iso8601='date -u +"%Y-%m-%dT%H:%M:%SZ"'
unalias l
alias la='ls -lAF'
alias ll='ls -lhA'
unalias lsa
alias lsg='f() { ls -lhA | grep "$*"; }; f'
alias mirror='wget -mkpnp'
alias ps='ps aux'
alias psg='f() { command ps aux | grep -v grep | grep -i -e VSZ -e "$*"; }; f'
alias reload="exec $SHELL -l"
alias repl='replem'
alias search='ag'
alias scp-as='f() { scp -i ~/.ssh/"$1" "${@:2}"; }; f'
alias scp-as-and-forget='f() { scp -o UserKnownHostsFile=/dev/null -i ~/.ssh/"$1" "${@:2}"; }; f'
alias scp-and-forget='f() { scp -o UserKnownHostsFile=/dev/null "$1" "${@:2}"; }; f'
alias ssh-as='f() { ssh -i ~/.ssh/"$1" "${@:2}"; }; f'
alias ssh-as-and-forget='f() { ssh -o UserKnownHostsFile=/dev/null -i ~/.ssh/"$1" "${@:2}"; }; f'
alias ssh-and-forget='f() { ssh -o UserKnownHostsFile=/dev/null "$1" "${@:2}"; }; f'
alias ssh-forward='f() { ssh -N -L "${1}:localhost:${1}" "${@:2}"; }; f'
alias ssh-forward-and-forget='f() { ssh -o UserKnownHostsFile=/dev/null -N -L "${1}:localhost:${1}" "${@:2}"; }; f'
alias ssh-forward-as='f() { ssh -i ~/.ssh/"$1" -N -L "${2}:localhost:${2}" "${@:3}"; }; f'
alias ssh-forward-as-and-forget='f() { ssh -o UserKnownHostsFile=/dev/null -i ~/.ssh/"$1" -N -L "${2}:localhost:${2}" "${@:3}"; }; f'
alias tarbz2='f() { tar -cjf "$1.tar.bz" "$1"; }; f'
alias targz='f() { tar -zcf "$1.tar.gz" "$1"; }; f'
alias tarxz='f() { tar -cJf "$1.tar.xz" "$1" }; f'
alias tcp='lsof -iTCP -s -n -P'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias udp='lsof -iUDP -s -n -P'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias week='date +%V'
alias zsh-upgrade='upgrade_oh_my_zsh'
alias zsh-stats='zsh_stats'

alias dl='download'

function dataurl() {
  local mimeType=$(file -b --mime-type "$1")

  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi

  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

function extract() {
  [ ! -f "$1" ] && return 1

  case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.tar.xz) tar xJf "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) 7z x "$1" ;;
    *.7z) 7z x "$1" ;;
    *) return 1 ;;
  esac
}
