FROM debian:bookworm-slim AS build-stage

# Keep update and install in the same RUN so if there are additional installs,
# they won't be based on a stale layer.
RUN apt-get update && \
    apt-get install -y make gcc git ruby-dev nodejs yarnpkg

RUN gem install bundler

RUN mkdir rails-template
WORKDIR rails-template
RUN bundle init
RUN bundle add rails
RUN bundle exec rails new .

RUN ruby --version | ruby -pe 'gsub(/(ruby \d+\.\d+\.\d+).*/, "\\1")' > .tool-versions && \
    node --version | ruby -pe 'gsub("v", "nodejs ")' >> .tool-versions && \
    yarnpkg --version | ruby -pe 'gsub(/^/, "yarn ")' >> .tool-versions

FROM scratch AS export-stage
COPY --from=build-stage /rails-template /
