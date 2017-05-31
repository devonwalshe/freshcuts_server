FROM ruby:2.4.1-alpine

RUN apk add --no-cache --update \
        postgresql-dev libxml2-dev zlib-dev tzdata yaml-dev build-base nodejs
    && rm -rf /var/cache/* \
    && rm -rf /root/.cache

RUN mkdir /freshcuts

WORKDIR /freshcuts

ADD . /freshcuts

RUN rm -f tmp/pids/*.pid

RUN bundle install

RUN RAILS_ENV=production bundle exec rake assets:precompile
