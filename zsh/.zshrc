# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/xav/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstallexport 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=nvim
export KEEPASS_DATABASE="${HOME}/Nextcloud/_kee.kdbx"
PATH="${PATH}:${HOME}/.local/bin"

export FZF_DEFAULT_OPTS='--layout=reverse-list --border --height=40%'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/base16-shell/base16-shell.plugin.zsh ] && . ~/.config/base16-shell/base16-shell.plugin.zsh
[ -f ~/.config/ripgrep/ripgreprc ] && export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/ripgreprc"

. $HOME/.config/zsh/_git.zsh
. $HOME/.config/zsh/_fzf.zsh
. $HOME/.config/zsh/_theme.zsh

alias vim=nvim
