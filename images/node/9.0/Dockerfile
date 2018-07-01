FROM php:7.1-cli
MAINTAINER TGHP <glasshouse@tghp.co.uk>

RUN apt-get update && apt-get install -y \
  cron \
  git \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  libxslt1-dev \
  mysql-client \
  vim \
  zip \ 
  zlib1g-dev \
  libicu-dev \
  g++ \
  libpng-dev \
  libmcrypt-dev \
  libxml2-dev \
  libxslt-dev

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  mbstring \
  mcrypt \
  opcache \
  pdo_mysql \
  soap \
  xsl \
  zip

RUN apt-get update \ 
  && apt-get install -y curl gnupg2 build-essential \
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
  && apt-get install -y nodejs

RUN npm install -g grunt-cli

COPY bin/run-grunt-all /usr/local/bin/
COPY bin/run-grunt-theme /usr/local/bin/

RUN groupadd --gid 1000 app
RUN useradd --home /var/www/html --shell /bin/bash --uid 1000 --gid 1000 app

WORKDIR /var/www/html

CMD ["/bin/bash"]
