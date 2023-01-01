# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=$USER

[[ -f ~/.env.machine ]] && source ~/.env.machine

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME='robbyrussell'
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias clean-branches="git checkout master; git fetch; git rebase; git branch --merged | grep -v '\*' | xargs -n 1 git branch -D"
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
plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

## Rbenv

## Local bin files first!
#
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
alias sforeman="foreman start | tee -a log/foreman.log"

if type "nvim" > /dev/null; then
  alias vim="nvim"
  alias vi="nvim"
fi

eval "$(ssh-agent -s)" > /dev/null
#add ssh key to keychain automatically
ssh-add ~/.ssh/id_rsa &> /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

if type "rbenv" > /dev/null; then
  eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Agnoster theme customization
# prompt_dir() {
#   prompt_segment blue black '%2~'
# }

aws-prod-mfa() {
  eval $(AWS_PROFILE=prod $HOME/.bin/aws-mfa $1)
}

export PATH="./bin:${PATH}"
export PATH="./.bin:${PATH}"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/.bin"
export PATH="./node_modules/.bin/:${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/Library/Python/3.6/bin/"
export PATH="${PATH}:${HOME}/Library/Python/2.7/bin/"

export GOPATH="${HOME}/workspace/go/"
export PATH="${PATH}:${HOME}/workspace/go/bin/"
export PATH=$PATH:/Users/brianmalinconico/.nexustools

export PATH=$PATH:~/Library/Android/sdk/platform-tools/
export PATH=$PATH:~/Library/Android/sdk/tools/

###-tns-completion-start-###
if [ -f /Users/brianmalinconico/.tnsrc ]; then 
    source /Users/brianmalinconico/.tnsrc 
fi
###-tns-completion-end-###

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ "$TERM" == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

[[ ! -f $HOME/.asdf/asdf.sh ]] || . $HOME/.asdf/asdf.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=nvim
export SHELL="$(which zsh)"

alias copper="bundle exec rubocop -A && git commit -am 'Copper' && git push"
