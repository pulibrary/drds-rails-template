#!/usr/bin/env sh
set -o errexit
set -o verbose

TAG=rails-template
NEW_DIR=template-new
OLD_DIR=template-dir

# The build --output option requires Buildkit.
# Buildkit is the default on desktop, but needs to be explicitly enabled in CI.
# See https://docs.docker.com/engine/reference/commandline/build/#custom-build-outputs
# > This feature requires the BuildKit backend. 

DOCKER_BUILDKIT=1 docker build docker-context --tag $TAG --output $NEW_DIR
echo 'Docker build successful! To connect:'
echo "  docker run -it $TAG"

# Remove files that do not belong in template:
cd $NEW_DIR
rm -rf .git \
       .ruby-version \
       config/master.key \
       config/credentials.yml.enc \
       log/development.log \
       tmp/development_secret.txt
cd ..


diff -r $OLD_DIR $NEW_DIR
echo "Yay! No difference between Docker output and $OLD_DIR."
