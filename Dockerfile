FROM       ubuntu:latest
FROM ruby:2.3.0
MAINTAINER CircleCI sayhi@circleci.com

ADD Gemfile /

RUN gem install bundler
RUN bundle install



