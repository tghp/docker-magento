FROM php:7.1-cli
MAINTAINER TGHP <glasshouse@tghp.co.uk>

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
  && apt-get update \
  && apt-get install nodejs build-essential

RUN npm install -g grunt-cli

WORKDIR /var/www/html

  
