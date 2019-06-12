[ -f ~/.config/base16-shell/base16-shell.plugin.zsh ] && . ~/.config/base16-shell/base16-shell.plugin.zsh

function zle-line-init zle-keymap-select {
  PROMPT=`purs prompt -k "$KEYMAP" -r "$?" --venv "${${VIRTUAL_ENV:t}%-*}"`
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz add-zsh-hook

function _prompt_purs_precmd() {
  purs precmd
}
add-zsh-hook precmd _prompt_purs_precmd
