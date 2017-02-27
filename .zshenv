
# This was taken out of /etc/zprofile because it was screwing with
# load orders
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="./bin:$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

if type "yarn" > /dev/null; then
  export PATH="$PATH:`yarn global bin`"
fi
