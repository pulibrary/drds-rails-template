#!/usr/bin/env sh
set -o errexit

TAG=rails-template
NEW_DIR=template-new
OLD_DIR=template-dir

# debugging...
echo "NEW_DIR? $NEW_DIR"
echo "docker build supports --output?"
docker help build
echo "write privs?"
mkdir this-is-a-test
touch this-is-a-test/123.txt
echo "ls cwd?"
ls
echo "ls new dir?"
ls this-is-a-test

docker build docker-context --tag $TAG --output $NEW_DIR
echo 'Docker build successful! To connect:'
echo "  docker run -it $TAG"

diff -r $OLD_DIR $NEW_DIR
echo "Yay! No difference between Docker output and $OLD_DIR."
