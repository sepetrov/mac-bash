source ~/.git-completion.bash
source ~/.bash_prompt
source ~/.git-prompt.sh
source ~/.bash_alias

export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
