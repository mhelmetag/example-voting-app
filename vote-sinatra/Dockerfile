FROM ruby:2.3-slim

WORKDIR /app

ADD Gemfile /app/Gemfile
RUN bundle install

ADD . /app

EXPOSE 4567

ENV PORT 4567

CMD ["ruby", "app:app"]
