# personal config start

# git info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b) '
setopt PROMPT_SUBST

# prompt format
PS1='%F{blue}%n@%m ${vcs_info_msg_0_}%F{green}%~ 
%F{green}>>%F{white} '

# ls colors
export LS_COLORS="cxfxcxdxbxegedabagacadah"

# aliases
alias lg='lazygit'
alias ls="ls --color=always"
alias tmuxd="tmux new-session -A -t dev"

# zsh plugins
source $HOME/personal/antigen.zsh
antigen bundle jeffreytse/zsh-vi-mode > /dev/null
antigen bundle zsh-users/zsh-autosuggestions > /dev/null
antigen apply

# personal config end
