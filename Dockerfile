FROM ruby:2.7.0-preview1-alpine
ENV PORT $PORT
EXPOSE $PORT
WORKDIR /app
ADD Gemfile .
ADD app.rb .
RUN bundle install
CMD bundle exec ruby app.rb  -o 0.0.0.0 -p $PORT
