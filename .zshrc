source ~/.zsh/antigen.zsh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

export TERM="xterm-256color"

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# alias tmux="tmux -2 -u"
# if which tmux 2>&1 >/dev/null; then
# 	test -z "$TMUX" && (tmux attach || tmux new-session)
# fi

# # Sensible, short .zshrc
# # Gist page: git.io/vSBRk  
# # Raw file:  curl -L git.io/sensible-zshrc

# # GNU and BSD (macOS) ls flags aren't compatible
# # ls --version &>/dev/null
# # if [ $? -eq 0 ]; then
# #   lsflags="--color --group-directories-first -F"
# # else
# #   lsflags="-GF"
# #   export CLICOLOR=1
# # fi

# # Aliases
# # alias ls="ls ${lsflags}"
# # alias ll="ls ${lsflags} -l"
# # alias la="ls ${lsflags} -la"
# # alias h="history"
# # alias hg="history -1000 | grep -i"
# # alias ,="cd .."
# # alias m="less"

# # GIT
# # Do this: git config --global url.ssh://git@github.com/.insteadOf https://github.com
# # alias gd="git diff"
# # alias gs="git status 2>/dev/null"
# # function gc() { git clone ssh://git@github.com/"$*" }
# # function gg() { git commit -m "$*" }

# git_inside_repo() {
# 	return $(git rev-parse --is-inside-work-tree 2>/dev/null)
# }

# git_prompt() {
# 	if ( git_inside_repo ); then
# 		ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
# 		echo " $ref"
# 	fi
# }

# setopt prompt_subst

# # More suitable for .zshenv
# # EDITOR=vim
# PS1='
# %F{5}%3~%F{241}$(git_prompt)
# %F{66}> '
# # PS1='%n%F{156}@%m %3~%(!.#.$)%(?.. [%?]) '

# # History settings
# HISTFILE=~/.history-zsh
# HISTSIZE=10000
# SAVEHIST=10000
# setopt append_history           # allow multiple sessions to append to one history
# setopt bang_hist                # treat ! special during command expansion
# setopt extended_history         # Write history in :start:elasped;command format
# setopt hist_expire_dups_first   # expire duplicates first when trimming history
# setopt hist_find_no_dups        # When searching history, don't repeat
# setopt hist_ignore_dups         # ignore duplicate entries of previous events
# setopt hist_ignore_space        # prefix command with a space to skip it's recording
# setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
# setopt hist_verify              # Don't execute immediately upon history expansion
# setopt inc_append_history       # Write to history file immediately, not when shell quits
# setopt share_history            # Share history among all sessions

# # Tab completion
# autoload -Uz compinit && compinit
# setopt complete_in_word         # cd /ho/sco/tm<TAB> expands to /home/scott/tmp
# setopt auto_menu                # show completion menu on succesive tab presses
# setopt autocd                   # cd to a folder just by typing it's name
# ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&' # These "eat" the auto prior space after a tab complete

# # MISC
# setopt interactive_comments     # allow # comments in shell; good for copy/paste
# unsetopt correct_all            # I don't care for 'suggestions' from ZSH
# export BLOCK_SIZE="'1"          # Add commas to file sizes

# # PATH
# typeset -U path                 # keep duplicates out of the path
# path+=(.)                       # append current directory to path (controversial)

# # BINDKEY
# bindkey -e
# # bindkey '\e[3~' delete-char
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# # bindkey ' '  magic-space


##
## Zsh Config
##
## :: Plugins
## :: Settings
## :: Completion

###
### Plugins
###

#source ~/.zplug/init.zsh

#zplug "zplug/zplug", hook-build:"zplug --self-manage"
#zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-autosuggestions"
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
#zplug "zsh-users/zsh-history-substring-search", defer:3

#zplug load

###
### Settings
###

#export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
#export FZF_DEFAULT_COMMAND='find .'

###
### Completion
###

### enable completion
#autoload -U compinit && compinit

### enable  shift tab in menu completion
#bindkey '^[[Z' reverse-menu-complete

### use N and P for substring history
#bindkey -M emacs '^P' history-substring-search-up
#bindkey -M emacs '^N' history-substring-search-down

### enable cli color for commands
#export CLICOLOR=1

### setup menu completion
#zstyle ':completion:*' menu select
#zstyle ':completion:*' completer _complete _approximate _expand
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
