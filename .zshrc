# Hand changed stuff
# ALIASES
alias giclrbr='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias dcu="docker-compose up"
alias prv="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias opn="code \$(prv)"
alias gcob="git checkout \$(git branch -l | fzf | sed 's/\?*.//')"
alias gcor="git checkout \$(git branch -r | grep origin | grep -v HEAD | fzf | sed 's/origin\///')"
alias gbrd="git branch -D \$(git branch | fzf)"

alias -s {js,ts,html}=code
alias lg='lazygit'
# Functions
function remove_from_history () {
	to_remove="${*//\s/\s}"
	LC_ALL=C sed -i '' '/;'"$to_remove"'$/d' "$HISTFILE"
	exec zsh
}

alias rfh=remove_from_history

alias la="eza --group-directories-first -a --icons --hyperlink"

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

# Tools activation
# enable oh-my-posh
# eval "$(oh-my-posh init zsh --config ~/theme.omp.json)"
# eval "$(mise activate zsh)"
# eval "$(zoxide init zsh) 