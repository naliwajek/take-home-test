FROM ruby:3.0.0

WORKDIR /app

COPY Gemfile .ruby-version ./

RUN bundle install

ADD . /app