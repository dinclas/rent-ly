FROM ruby:2.6.5-alpine

WORKDIR /usr/src
EXPOSE 3000

COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN apk update && \
  apk add --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    nodejs=12.15.0-r1 \
    yarn \
    graphviz && \
    bundle && \
    yarn && \
    apk del build-base && \
    rm -r /var/cache/apk/*

COPY . .
