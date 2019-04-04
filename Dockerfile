FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /hike_vote_app
WORKDIR /hike_vote_app

COPY Gemfile /hike_vote_app/Gemfile
COPY Gemfile.lock /hike_vote_app/Gemfile.lock
RUN bundle install
ADD . /hike_vote_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
