# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="syslac"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

export EDITOR="vim"
bindkey -v 
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/syslac/bin:/home/syslac/perl5/bin:/home/syslac/bin:/usr/local/bin:/usr/bin:/bin:/usr/games
export PERL_LOCAL_LIB_ROOT="/home/syslac/perl5";
export PERL_MB_OPT="--install_base /home/syslac/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/syslac/perl5";
export PERL5LIB="/home/syslac/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/syslac/perl5/lib/perl5";
export PATH="/home/syslac/perl5/bin:$PATH";
