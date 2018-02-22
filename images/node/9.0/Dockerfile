FROM php:7.1-cli
MAINTAINER TGHP <glasshouse@tghp.co.uk>

RUN apt-get update \ 
  && apt-get install -y curl gnupg2 build-essential \
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
  && apt-get install -y nodejs

RUN npm install -g grunt-cli

COPY bin/run-grunt-all /usr/local/bin/
COPY bin/run-grunt-theme /usr/local/bin/

WORKDIR /var/www/html

CMD ["/bin/bash"]
