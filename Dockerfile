FROM ruby:3.0.1

# railsコンソール中で日本語入力するための設定
ENV LANG C.UTF-8

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt update -qq && apt install -y nodejs build-essential yarn postgresql-client libpq-dev \
    curl dirmngr apt-transport-https lsb-release ca-certificates

ENV APP_ROOT /learning_management_app
RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
COPY ./Gemfile ${APP_ROOT}/Gemfile
COPY ./Gemfile.lock ${APP_ROOT}/Gemfile.lock

RUN bundle config set force_ruby_platform true
RUN bundle install

COPY ./ ${APP_ROOT}

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

RUN mkdir -p tmp/sockets

# CMD ["rails", "server", "-b", "0.0.0.0"]