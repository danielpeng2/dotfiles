# Enable colors
autoload -U colors && colors

# History in cache directory
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# emacs mode
bindkey -e

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats ' %F{245}(%b)%f'
zstyle ':vcs_info:*' enable git

# Set prompt
PROMPT="[%B%F{yellow}%~%f%b]$ "

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Colorize ls output
alias ls='ls --color'

# Attach to existing tmux session, otherwise start a new one
[ -z "$TMUX" ] && { tmux attach || exec tmux new-session; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
