
# This was taken out of /etc/zprofile because it was screwing with
# load orders
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export PATH="./node_modules/.bin:./bin:$HOME/.yarn/bin:$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
