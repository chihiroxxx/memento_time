FROM ruby:2.6.5


RUN apt-get update -qq && apt-get install -y build-essential

RUN sed -i 's%GPG_CMD="gpg %GPG_CMD="gpg --batch %g' /usr/bin/apt-key

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn

RUN apt-get install -y nodejs default-mysql-client

RUN gem install bundler

WORKDIR /usr/src/app/var/www/back
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
COPY . .


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD bash -c "rm -f tmp/pids/unicorn.pid && bundle exec rails s -e production -p 3000 -b '0.0.0.0'"

