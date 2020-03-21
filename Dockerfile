FROM ruby:2.7

ENV rails_ver="5.2.4"

# パッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs



# 作業ディレクトリを作成・指定
RUN mkdir /myapp
WORKDIR /myapp

# ローカルのGemfileをDokcerにコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# ディレクトリ上でbundle install
RUN bundle install

# ローカル環境のディレクトリ（rails newで作成された一式）をDocker環境にコピー
COPY . /myapp
