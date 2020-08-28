FROM php:7.4.9-cli-alpine3.12

ARG COMPOSER_VERSION="1.10.10"
ARG TERCLIENT_VERSION="dev-master#2afdb1a04c0975a31ab4450daed732bc5f84ea7f"

ENV COMPOSER_HOME="/usr/local/composer"

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '8a6138e2a05a8c28539c9f0fb361159823655d7ad2deecb371b04a83966c61223adc522b0189079e3e9e277cd72b8897') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN apk add -U git
RUN composer -n global require --dev helhum/ter-client ${TERCLIENT_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]