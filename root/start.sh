#!/usr/bin/env sh

if [ "x$GIT_REPO" != "x" ]; then
	git clone $GIT_REPO
fi

/usr/local/bin/node server.js $1