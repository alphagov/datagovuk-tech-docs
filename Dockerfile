FROM ruby:3.2.10

WORKDIR /app
COPY Gemfile Gemfile.lock ./
COPY . /app/
RUN apt-get update && apt-get install -y build-essential nodejs
RUN bundle install

CMD ["bundle", "exec", "middleman", "server"]

EXPOSE 4567
