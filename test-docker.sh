#!/usr/bin/env bash
set -o errexit

TAG=rails-template
NEW_DIR=template-new
OLD_DIR=template-dir

docker build docker-context --tag $TAG --output $NEW_DIR
echo 'Docker build successful! To connect:'
echo "  docker run -it $TAG"

diff -r $OLD_DIR $NEW_DIR
echo "Yay! No difference between Docker output and $OLD_DIR."
