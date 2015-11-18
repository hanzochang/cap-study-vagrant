export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=vim
export TERM=screen-256color
setopt nobeep

#---------------------------------------------------------------------------
# History
#---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt extended_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_verify
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#---------------------------------------------------------------------------
# Complement
#---------------------------------------------------------------------------
autoload -U compinit
compinit
setopt auto_pushd
setopt correct
setopt correct_all
setopt hist_expand
setopt list_types
setopt auto_list
setopt auto_menu
setopt list_packed
setopt auto_param_keys
setopt auto_param_slash
setopt mark_dirs
setopt auto_cd
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt nolistbeep

#---------------------------------------------------------------------------
# Appearance
#---------------------------------------------------------------------------
autoload -U colors
colors
setopt prompt_subst
export LSCOLORS=gxfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=36;49'

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#---------------------------------------------------------------------------
# Prompt
#---------------------------------------------------------------------------
PROMPT="%{${fg[yellow]}%}%/%{${reset_color}%} "
PROMPT2="%{${fg[yellow]}%}%_%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
RPROMPT="%1(v|%F{green}%1v%f|)"
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[cyan]}%}%n@${HOST%%.*} ${PROMPT}"

#---------------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------------
alias ll='ls -ltr'
alias la='ls -lhAF'

alias diff='colordiff'

alias be='bundle exec'

alias g='git'
alias gci='git commit'
alias gst='git status'
alias glg='git log'
alias gaa='git add .'
alias gdf='git diff'
alias gco='git checkout'

alias gffs='git flow feature start'
alias gfff='git flow feature finish'

alias ssms='sudo service mysql stop ; sudo service mysql start'
alias rs0='rails s -b 0.0.0.0'
alias tdbreset='rake RAILS_ENV=test db:drop db:create db:migrate db:seed'

alias rrese='rake db:drop db:create db:migrate'

alias tn='tmux new -s'
alias ta='tmux attach -t'

alias migrate='./bin/spring rake db:migrate; ./bin/annotate -i'
alias migrate_reset='./bin/spring rake db:migrate:reset; ./bin/annotate -i'

alias nrs="sudo /etc/init.d/networking restart"
alias webserver='ruby -run -ehttpd . -p8000'

#---------------------------------------------------------------------------
# Others
#---------------------------------------------------------------------------
function reload() {
  source $HOME/.zshrc
}

function chpwd() {
  ls
}

function greplace() {
  git grep -l $1 | xargs sed -i -e "s/$1/$2/g"
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# export RBENV_ROOT=/usr/local/rbenv
# export PATH="${RBENV_ROOT}/bin:${PATH}"
# eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
