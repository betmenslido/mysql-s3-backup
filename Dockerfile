# docker build . --tag=backy:latest

FROM ruby:2.7.5-alpine3.15

ADD install.sh .
RUN ./install.sh && rm install.sh

ADD run.sh backup.rb Gemfile Gemfile.lock .

ENV LANG C.UTF-8
ENV SCHEDULE **None**

# https://bundler.io/man/bundle-config.1.html#REMEMBERING-OPTIONS
RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'

RUN bundle install --jobs=4 && rm -rf /root/.bundle/cache/*

CMD ["./run.sh"]
