# Set nvim as default editor
if type nvim > /dev/null; then
    alias vim='nvim'
    export VISUAL=nvim
    export EDITOR="$VISUAL"
fi

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
PROMPT="%B%F{yellow}%~ $ %f%b"

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Colorize ls output
alias ls='ls --color'

# Attach to existing tmux session, otherwise start a new one
if type tmux > /dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add pyenv to path
export PATH="/home/daniel/.pyenv/bin:$PATH"
if type pyenv > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# add poetry to path
if type poetry > /dev/null; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add spicetify to path
if type spicetify > /dev/null; then
    export SPICETIFY_INSTALL="/home/daniel/spicetify-cli"
    export PATH="$SPICETIFY_INSTALL:$PATH"
fi

# ssh to school server
alias login="ssh d6peng@linux.student.cs.uwaterloo.ca"
alias login_2="ssh d6peng@ubuntu1804-002.student.cs.uwaterloo.ca"
alias login_4="ssh d6peng@ubuntu1804-004.student.cs.uwaterloo.ca"
alias login_8="ssh d6peng@ubuntu1804-008.student.cs.uwaterloo.ca"
