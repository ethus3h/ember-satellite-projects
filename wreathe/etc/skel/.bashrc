# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

export PATH="/usr/local/bin/:/usr/sbin/:/sbin/:$PATH"
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin
nano() { if [[ -w "${@:(-1)}" ]]; then /usr/bin/nano -wLN "$@"; else sudo -k /usr/bin/nano -wLN "$@"; fi; }

PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w nohup compiz --replace openbox \$\[\033[00m\] "
eval $(thefuck --alias)

source /usr/bin/bash_setup
unset HISTSIZE 
unset HISTFILESIZE
shopt -s histappend

PS4='+($?) $BASH_SOURCE:$FUNCNAME:$LINENO:'
export PS4
