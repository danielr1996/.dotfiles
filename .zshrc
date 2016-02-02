#Screenfetch
screenfetch -p -E -c41,25 -A 'Arch Linux'   
#Powerline
if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
	source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias lad="ls -lhFA --color | grep -E '^d[rwx-]{9}'"
alias laf="ls -lhFA --color | grep -E '^\-[rwx-]{9}'"
alias lvd="ls -lhF --color | grep -E 'd[rwx-]{9}'"
alias lvf="ls -lhF --color | grep -E '\-[rwx-]{9}'"
alias lhd='ls -lhAF1 --color | grep -E "^d[rwx-]{9}.*[0-9]{2}:[0-9]{2} "$'\''\x1b'\''"\[([0-9]{1,2}m?)(;[0-9]{1,2}m?)?\."'
alias lhf="ls -lhFAd --color .* | grep -E '^[rwx-]{9}'"
alias ll="lvd; lhd; lvf; lhf;"
alias la="lvd; lvf"
alias rm="rm -r"
alias cp="cp -r"
