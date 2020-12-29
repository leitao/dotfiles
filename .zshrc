# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/leit/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="breno"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# Using the plugins separated now
#plugins=(mercurial git z zsh-syntax-highlighting colored-man-pages colorize dircycle z zsh-autosuggestions)
plugins=(mercurial git z colored-man-pages colorize dircycle z k)

# FB stuff for WWW
source /etc/zshrc
source /usr/facebook/ops/rc/master.zshrc
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
EDITOR=vim

#export http_proxy="http://fwdproxy.any:8080"
#export https_proxy="$http_proxy"
#export http_proxy="http://fwdproxy:8080"
#export https_proxy="http://fwdproxy:8080"
#export ftp_proxy="http://fwdproxy:8080"
#
export no_proxy=".facebook.com,.tfbnw.net,.fb.com, .fbcdn.net"
alias vi=vim
PATH=$PATH:/home/leit/gz
export CSCOPE_EDITOR=/bin/vim

export ZSH_DISABLE_COMPFIX=true

alias cscope="cscope -k -d"
alias ubu="ssh gizmo@2620:10d:c0bb:403:c581:a2fa:7678:1417"
alias marvin="ssh monolith@2620:10d:c0bb:403:1103:686a:772a:d67c"
alias subu="sftp gizmo@\[2620:10d:c0bb:403:c581:a2fa:7678:1417\]"
alias c="cd ~/collabeng"
alias w="cd ~/www"
alias f="cd ~/fbcode"
alias debian="sudo chroot /home/leit/debian"
alias ge="git edit"
alias mar="ssh monolith@2620:10d:c0bb:403:634e:ff28:f764:2b9d"
alias gd="git diff --relative --no-prefix"
#alias ghci="/usr/local/bin/ghci"

# Open Embedded
alias oe="source ~/bin/oe.sh"
# Internet
alias net="source ~/bin/net.sh"
# plat
alias plat="source /opt/rh/devtoolset-7/enable"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Full words
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>"'

#vim tags
function _get_tags {
  [ -f ./tags ] || return
  local cur
  read -l cur
  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
}
compctl -x 'C[-1,-t]' -K _get_tags -- vim
#end vim tags

source /home/leit/Devel/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Share history
setopt share_history

