# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=$USER

[[ -f ~/.env.machine ]] && source ~/.env.machine

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
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
plugins=(git)

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/brianmalinconico/workspace/dotfiles/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/brianmalinconico/workspace/dotfiles/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/brianmalinconico/workspace/dotfiles/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/brianmalinconico/workspace/dotfiles/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

if type "rbenv" > /dev/null; then
  eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Agnoster theme customization
prompt_dir() {
  prompt_segment blue black '%2~'
}

export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/.bin"
export PATH="./node_modules/.bin/:${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/Library/Python/3.6/bin/"
export PATH="${PATH}:${HOME}/Library/Python/2.7/bin/"

export GOPATH="${HOME}/workspace/go/"
export PATH="${PATH}:${HOME}/workspace/go/bin/"
