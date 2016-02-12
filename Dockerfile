FROM       ubuntu:latest
FROM ruby:2.3.0


MAINTAINER CircleCI sayhi@circleci.com
EXPOSE 4567
# todo: move this out of the container
RUN apt-get update
RUN apt-get install -y mongodb
ADD . /opt/pagerbot
WORKDIR /opt/pagerbot
RUN gem install bundler
RUN bundle install
ENV DEPLOYED=true
ENV RACK_ENV=:production
ENTRYPOINT mongod --fork --logpath /var/log/mongodb/mongodb.log  --dbpath /var/lib/mongodb && bundle exec ruby lib/pagerbot.rb admin slack

