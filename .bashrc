PS1="\e[1;34m\u@\h (\#)\e[m \e[1;32m[\A] \W $ \e[m"

alias ls="ls --color"
alias ll="ls -l"
alias grep="ack-grep"
alias grepc="grep -niH"
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

export PERL_LOCAL_LIB_ROOT="/home/syslac/perl5";
export PERL_MB_OPT="--install_base /home/syslac/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/syslac/perl5";
export PERL5LIB="/home/syslac/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/syslac/perl5/lib/perl5";
export PATH="/home/syslac/perl5/bin:$PATH";
