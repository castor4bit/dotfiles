LANG=ja_JP.UTF-8
EDITOR=vim
PAGER=less
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$PATH:/Applications/Flex3SDK/bin
NEKOPATH=/usr/lib/neko
VIMRUNTIME=/usr/share/vim/vim70

export LANG
export EDITOR
export PAGER
export PATH
export NEKOPATH
export VIMRUNTIME

autoload -U compinit
compinit
bindkey -v

#setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt no_beep
setopt no_list_beep
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_remove_slash
setopt always_last_prompt
setopt complete_in_word
setopt correct
setopt list_types
setopt prompt_subst
setopt extended_glob
setopt no_flow_control
setopt print_eight_bit
setopt cdable_vars
setopt magic_equal_subst
setopt ignore_eof

unsetopt promptcr

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=500
setopt hist_ignore_dups
setopt hist_ignore_space
setopt extended_history
setopt append_history
setopt share_history

alias ls='ls -G'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ..'
alias vi='vim'

if [ "$TERM" = "dumb" ] ; then
    PROMPT='%h %n@%m[%d] %# '
    RPROMPT='%D %T'
else
    PROMPT="[%B%n%b@%m] $ "
    RPROMPT="%d"
fi

# script lgg
now=`date +%Y%m%d%H%M%S`
user=`whoami`
logdir=/private/var/log/script_log/$user
logfile=$logdir/$now.log

if [ ! -e $logdir ]; then
    mkdir $logdir
fi

p_proc=`ps -ef|grep $PPID|grep zsh|awk '{print $8}'`
if [ "$p_proc" = -zsh ]; then
    script -aq $logfile
    exit
fi

