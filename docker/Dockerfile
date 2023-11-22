FROM ruby:3.2.2

WORKDIR /srv/app/datagovuk_tech_docs

RUN apt-get update
RUN apt-get install -y nodejs

COPY ./ /srv/app/datagovuk_tech_docs

RUN gem install bundler && bundle install && bundle exec middleman build
