# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/.config/term/zshrc.head

# PCO
[ -f $HOME/.config/term/zshrc.work ] && source $HOME/.config/term/zshrc.work

# MAIN
source $HOME/.config/term/zshrc.main

# User configuration
source $HOME/.config/term/zshrc.user

# Tail
source $HOME/.config/term/zshrc.tail

if type devbox &> /dev/null; then
  eval "$(devbox global shellenv)"
fi

if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if type direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# allow emacs style CTRL-A, CTRL-E
bindkey -e
