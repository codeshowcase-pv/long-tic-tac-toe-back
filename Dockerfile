FROM ruby:3.0.1

WORKDIR /long-tic-tac-toe-back

COPY Gemfile Gemfile.lock ./

RUN bash -c "apt-get update && gem install bundler:2.2.15 && bundle install"
