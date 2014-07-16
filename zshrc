export PATH=/usr/local/bin:$PATH
export PATH=./script:$PATH
export dotfilespath=$HOME/dotfiles
export SILENT_SETENV=true

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

source $dotfilespath/zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion $dotfilespath/zshuery/completion
# load_correction

source $dotfilespath/zsh_aliases

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

export EDITOR='vim'

autoload -U promptinit && promptinit
prompt pure

################
# VIM MODE ON! #
################

export KEYTIMEOUT=1
bindkey -v

vim_ins_mode="%{$fg_bold[red]%}-- INSERT --%{$reset_color%}"   
vim_cmd_mode="%{$fg_bold[green]%}-- NORMAL --%{$reset_color%}"   
vim_mode=$vim_ins_mode   
    
function zle-keymap-select {   
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"   
  zle reset-prompt   
}   
zle -N zle-keymap-select   
    
function zle-line-finish {   
  vim_mode=$vim_ins_mode   
}   
zle -N zle-line-finish   
RPROMPT='${vim_mode}'
###############
#

tmuxer() {
  tmux attach-session -t "$*" || tmux new-session -s "$*"
}
