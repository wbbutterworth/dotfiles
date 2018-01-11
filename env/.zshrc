#
# Zsh
#
# :: Plugins
# :: Settings
# :: Prompt

#
# Plugins
#

source ~/.zsh/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Settings
#

export TERM="xterm-256color"

setopt prompt_subst

# use ctrl-n and ctrl-p for history search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# GNU and BSD (macOS) ls flags aren't compatible
ls --version &>/dev/null
if [ $? -eq 0 ]; then
  lsflags="--color --group-directories-first -F"
else
  lsflags="-GF"
  export CLICOLOR=1
fi

# Aliases
alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -l"
alias la="ls ${lsflags} -la"

#
# Prompt
#

git_branch() {
	if ( $(git rev-parse --is-inside-work-tree 2>/dev/null) ); then
		ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
		echo "(%F{2}$ref%F{4})"
	fi
}

user_info() {
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then	
		echo '%F{241}%n@%m'
	fi
}

local dir='%F{4}%3~$(git_branch)'
local user='$(user_info)'
local char='%(?.%F{5}.%F{1})%#'

PROMPT="
$dir $user
$char %F{15}"
