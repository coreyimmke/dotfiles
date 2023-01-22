# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Which plugins would you like to load?
plugins=(git history)

source $ZSH/oh-my-zsh.sh
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:git:dirty color yellow
zstyle :prompt:pure:git:action color magenta
zstyle :prompt:pure:virtualenv color cyan
prompt pure
PROMPT='%F{white}%* '$PROMPT

export LANG=en_US.UTF-8
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"

if [ -f ~/.zsh_functions ]; then
    source ~/.zsh_functions
else
    print "ERROR: ~/.zsh_functions not found."
fi

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
else
    print "ERROR: ~/.zsh_aliases not found."
fi

if [ -f ~/.zsh_tbx ]; then
    source ~/.zsh_tbx
else
    print "ERROR: ~/.zsh_tbx not found."
fi
