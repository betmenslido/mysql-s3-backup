FROM ruby:2.7.5-alpine3.15

ADD install.sh .
RUN ./install.sh && rm install.sh

WORKDIR /app

ADD Gemfile Gemfile.lock .

ENV LANG C.UTF-8
ENV SCHEDULE **None**

# https://bundler.io/man/bundle-config.1.html#REMEMBERING-OPTIONS
RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'

RUN bundle install --jobs=4 && rm -rf /root/.bundle/cache/*

ADD run.sh run_backup.rb .
# dot syntax no worky for dirs
ADD lib lib

CMD ["./run.sh"]
