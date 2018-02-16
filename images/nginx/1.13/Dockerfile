FROM nginx:1.13
MAINTAINER Mark Shust <mark@shust.com>

RUN apt-get update && apt-get install -y \
  curl 

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - \ 
  && apt-get install -y nodejs

RUN npm install -g grunt-cli

COPY bin/run-grunt-all /usr/local/bin/
COPY bin/run-grunt-theme /usr/local/bin/

RUN groupadd -g 1000 app \
 && useradd -g 1000 -u 1000 -d /var/www -s /bin/bash app
RUN touch /var/run/nginx.pid
RUN mkdir /sock
RUN chown -R app:app /var/cache/nginx/ /var/run/nginx.pid /sock

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/default.conf /etc/nginx/conf.d/

USER app:app

VOLUME /var/www

WORKDIR /var/www/html
