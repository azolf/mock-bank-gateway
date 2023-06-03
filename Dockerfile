FROM ruby:3.1.3

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle

COPY . /app/

CMD ruby server.rb