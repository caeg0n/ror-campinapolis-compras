FROM ruby:2.7.6-buster
ENV RAILS_ROOT /app
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && \
  apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  libpq-dev && \
  mkdir -p $RAILS_ROOT && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log
WORKDIR $RAILS_ROOT
ENV RAILS_ENV='development'
#ENV RAILS_ENV='production'
ENV RAILS_SERVE_STATIC_FILES='true'
#ENV SECRET_KEY_BASE='2502e3fba52ad66fcef930dcf59ad9210d3e1a1aceadd6077c7498d05519656c9face8929c52708b06d3c5de98f3e8d397f2993324c6f6c1750635214e20c040'
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
#RUN bundle install --jobs 20 --retry 5 --without development test
RUN bundle install --jobs 20 --retry 5
#COPY package.json package.json
COPY yarn.lock yarn.lock
COPY . .
RUN yarn install --check-files
#RUN bundle exec rails assets:precompile
EXPOSE 3000
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
#CMD ["bundle", "exec", "rails", "s","-b","0.0.0.0","-e","production"]
#local
#sudo docker run --name prefeitura_vue -v ~/Documents/docker/db:/app/db -v ~/Documents/docker/db/imagens:/app/public/imagens -p 3000:3000 prefeitura_vue
#docker
#sudo docker run --name prefeitura_vue -v ~/db:/app/db -v ~/db/imagens:/app/public/imagens -p 3000:3000 prefeitura_vue
#deploy
#sudo docker build --rm --tag prefeitura_vue .
#sudo docker tag prefeitura_vue k43g0n/prefeitura_vue:v_1
#sudo docker push k43g0n/prefeitura_vue:v_1
##################################################################################################################

#FROM ruby:2.6.5-slim-stretch
#RUN apt-get update && apt-get install -y \
#  curl \
#  build-essential \
#  libpq-dev &&\
#  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
#  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#  apt-get update && apt-get install -y nodejs yarn
#RUN mkdir /app
#WORKDIR /app
#EXPOSE 3000
#COPY Gemfile .
#COPY Gemfile.lock .
#RUN gem update bundler
#RUN bundle install --jobs 5
#COPY package.json .
#COPY yarn.lock .
#RUN yarn install
