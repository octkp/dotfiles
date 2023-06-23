if ! command -v fzf &>/dev/null; then
  $(brew --prefix)/opt/fzf/install
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fcat() {
  find * -type f | fzf --layout=reverse --preview "bat --color=always {}"
}

fv() {
  local files
  files=$(fzf-tmux -d 40% --multi --preview-window=right:70% \
    --preview 'bat --color=always --style=header,grid --line-range :500 {}') &&
  nvim ${files}
}