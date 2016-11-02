# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export AWS_ID=kevy
export AWS_SECRET=kevy
DEFAULT_USER=$USER
# cert.pem file for openssl
#export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME='robbyrussell'
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias don='pair up strukturedkaos'
alias tmux-start='sh /usr/share/tmux-start.sh'

alias clean-branches="git checkout master; git fetch; git rebase; git branch --merged | grep -v '\*' | xargs -n 1 git branch -D"

alias mm="middleman"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# rbenv install
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Customize to your needs...
export PATH="./bin:$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

