autoload -U colors && colors	# Load colors

autoload -Uz vcs_info # Load version control information
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git*' formats "%F{blue}%s:(%f%F{red}%b%f%F{blue}) %f %m%u%c"

setopt prompt_subst

autoload -U compinit #Auto completion
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Aliases
alias zrc='nvim ~/.zshrc'
alias air='~/go/bin/air'
alias neovim='cd ~/.config/nvim/ && nvim .'
alias ls='ls --color=auto'
alias minecraft="cd ~/Downloads && java -jar TLauncher-*"
alias ff="fastfetch"
alias tmux="tmux -2 -u"

# Bindkey settings
bindkey -v
KEYTIMEOUT=10
function zle-keymap-select () {
  case $KEYMAP in
  vicmd) echo -ne '\e[2 q';; # block
  viins|main) echo -ne '\e[6 q';; # beam
  esac
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[2 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

setopt PROMPT_SUBST
PROMPT='%F{red}󰁔%f %F{cyan}${PWD/#$HOME/~}%f ${vcs_info_msg_0_}'

# Exports
export PATH=$PATH:/usr/local/go/bin
export TERM=xterm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
