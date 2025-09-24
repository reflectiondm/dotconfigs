# Hand changed stuff
# ALIASES
alias gilamas="git co master; git fetch --prune; git pull"
alias giclrbr='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias bash-reload="source ~/.bashrc"
alias dcu="docker-compose up"
alias prv="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias opn="code \$(prv)"
alias gcob="git checkout \$(git branch -l | fzf | sed 's/\?*.//')"
alias gcor="git checkout \$(git branch -r | grep origin | grep -v HEAD | fzf | sed 's/origin\///')"
alias gbrd="git branch -D \$(git branch | fzf)"
alias grh="git reset --hard"

alias -s {js,ts,html}=code
alias lvim="/Users/andreizubov/.local/bin/lvim"
alias git='LANG=en_GB git'
alias lg='lazygit'
# Functions
function remove_from_history () {
	to_remove="${*//\s/\s}"
	LC_ALL=C sed -i '' '/;'"$to_remove"'$/d' "$HISTFILE"
	exec zsh
}

alias rfh=remove_from_history

tw() {
  yarn jest $1 --watch
}
tt() {
  yarn jest $1
}

tld() {
  tldr -m $1 $2 $3 $4 | glow -
}
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme TwoDark'"
