
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="./bin:$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

if type "yarn" > /dev/null; then
  export PATH="$PATH:`yarn global bin`"
fi
