FROM ruby:2.7.5-alpine3.15

COPY install.sh .
RUN ./install.sh && rm install.sh

WORKDIR /app

COPY Gemfile Gemfile.lock .

ENV LANG C.UTF-8

# https://bundler.io/man/bundle-config.1.html#REMEMBERING-OPTIONS
RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'

RUN bundle install --jobs=4 && rm -rf /root/.bundle/cache/*

ENV SCHEDULE **None**
ENV MODEL_NAME mybackup
ENV S3_KEY_ID ''
ENV S3_KEY ''
ENV S3_BUCKET_NAME ''
ENV S3_REGION ''
ENV S3_PATH ''
ENV DB_HOST ''
ENV DB_NAME ''
ENV DB_USER ''
ENV DB_PASSWORD ''

COPY run.sh run.rb .
COPY lib lib

CMD ["./run.sh"]
