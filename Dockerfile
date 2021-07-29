FROM php:7.4.9-cli-alpine3.12

ARG COMPOSER_VERSION="1.10.10"
ARG TERCLIENT_VERSION="dev-master#2afdb1a04c0975a31ab4450daed732bc5f84ea7f"

ENV COMPOSER_HOME="/usr/local/composer"

RUN php -r "copy('https://raw.githubusercontent.com/composer/getcomposer.org/11a3bc677c1e6f2b120578d61b780aed7bfdff58/web/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN apk add -U git
RUN composer -n global require --dev helhum/ter-client ${TERCLIENT_VERSION}

RUN apk add -U libxml2-dev
RUN docker-php-ext-install soap

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
