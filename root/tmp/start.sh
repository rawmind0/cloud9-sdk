#!/usr/bin/env sh

cd $SERVICE_HOME

if [ "x$GIT_REPO" != "x" ]; then
	git clone $GIT_REPO
fi

/usr/local/bin/node server.js $1