LANG=ja_JP.UTF-8
EDITOR=vim
PAGER=less
MANPATH=$MANPATH:/opt/local/man
NEKOPATH=/usr/lib/neko
HAXE_LIBRARY_PATH=/usr/lib/haxe/std:/usr/lib/haxe/lib:.
VIMRUNTIME=/opt/local/share/vim/vim73
RUBYLIB=/opt/local/lib/ruby/1.8:/opt/local/lib/ruby/site_ruby/1.8/:/opt/local/lib/ruby/vendor_ruby/1.8/:$RUBYLIB
GOROOT=$HOME/go
GOOS=darwin
GOARCH=386
GOBIN=$GOROOT/bin
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$PATH:/Applications/Flex3SDK/bin
PATH=$PATH:$GOBIN

export LANG
export EDITOR
export PAGER
export PATH
export MANPATH
export NEKOPATH
export HAXE_LIBRARY_PATH
export VIMRUNTIME
export RUBYLIB
export GOROOT
export GOOS
export GOARCH
export GOBIN

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
alias ll='ls -Gla'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ..'
alias vi='vim'
#alias screen='screen -UxR'

if [ "$TERM" = "dumb" ] ; then
    PROMPT='%h %n@%m[%d] %# '
    RPROMPT='%D %T'
else
    PROMPT="[%B%n%b@%m] $ "
    RPROMPT="%d"
fi

preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}
[ ${STY} ] || screen -UxR
