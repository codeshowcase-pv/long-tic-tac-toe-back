FROM ruby:3.0.1

WORKDIR /long-ttt-back

COPY Gemfile Gemfile.lock ./

RUN bash -c "apt-get update && \
             apt-get upgrade && \
             gem update --system && \
             bundle"
