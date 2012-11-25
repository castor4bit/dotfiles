# Environment variables
export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=less
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=500

# Builtin Commands
autoload -U compinit && compinit
bindkey -v

# Aliases
case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G"
    ;;
  linux*)
    alias ls="ls --color"
    ;;
esac
alias ll='ls -la'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ..'
alias vi='vim'
alias less='less -FRSX'

# Options - Changing Directories
setopt auto_cd
setopt auto_pushd
setopt cdable_vars
setopt pushd_ignore_dups

# Options - Completion
setopt always_last_prompt
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_remove_slash
setopt complete_in_word
setopt complete_aliases
setopt list_types
setopt no_list_beep

# Options - Expansion and Glabbing
setopt extended_glob
setopt magic_equal_subst

# Options - History
setopt append_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt share_history

# Options - Input/Output
setopt correct
setopt no_flow_control
setopt ignore_eof
setopt print_eight_bit

# Options - Prompting and Others
setopt no_beep
setopt prompt_subst
unsetopt promptcr

# Environment variables
PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Local Settings
if [[ -s $HOME/.zshrc.mine ]] ; then source $HOME/.zshrc.mine ]] ; fi

# Prompt
if [ "$TERM" != "dumb" ] ; then
    PROMPT="[%B%n%b@%m] $ "
    RPROMPT="%d"
fi

# Show last command on status line
preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}

# Startup screen on login
[ ${STY} ] || screen -D -RR -U
