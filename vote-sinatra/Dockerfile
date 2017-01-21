FROM ruby:2.3-slim

WORKDIR /app

ADD Gemfile /app/Gemfile
RUN bundle install

ADD . /app

EXPOSE 80

CMD ["ruby", "app.rb"]
