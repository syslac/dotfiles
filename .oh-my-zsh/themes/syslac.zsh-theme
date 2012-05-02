ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "- $ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function workdir {
	echo `basename "$(pwd)"`
}

function charge {
	echo `laptop-charge`
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '$'
}

PROMPT='%{$terminfo[bold]$fg[blue]%}%n@%m (%h) %{$reset_color%} %{$terminfo[bold]$fg[green]%}[%T - $(charge)] $(workdir)%{$reset_color%} $(git_custom_status)$(prompt_char) '
