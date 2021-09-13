FROM ruby:alpine

RUN apk update
RUN apk add build-base nodejs postgresql-dev tzdata
RUN gem install -N rails

FROM ruby:2.6.0
RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app
COPY ./app/Gemfile.lock /app
COPY Rakefile /app
COPY yarn.lock /app

ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential libpq-dev curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt install nodejs yarn
RUN yarn install
RUN bundle install 

ENV app /app2
RUN mkdir -p /app2
WORKDIR /app2
ADD . /app2

CMD rails s -b 0.0.0.0
