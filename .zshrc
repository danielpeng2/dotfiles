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
# _comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=5

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Set prompt and change color for different vi modes
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      PROMPT=$'[%B%F{yellow}%~%f%b]%F{red}$%f ' ;;
        (main|viins) PROMPT=$'[%B%F{yellow}%~%f%b]$ ' ;;
        (*)          PROMPT=$'[%B%F{yellow}%~%f%b]$ ' ;;
    esac
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Colorize ls output
alias ls='ls --color'
