FROM nginx:stable-alpine as builder

ARG VERSION
ENV VERSION=0.0.18

LABEL build_version=${VERSION}
LABEL maintainer="Thallheim <thall@thallheim.com"
LABEL vendor="Thallheim Industries"
LABEL license="MIT"
LABEL url="https://https://github.com/thallheim/yggdrasil"

RUN \
    echo "INFO: Install build deps" && \
    apk update && \
    apk add --virtual=build-dependencies \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    openssl-dev \
    python3-dev \
    python3 \
    py3-pip && \
    echo "INFO: Install runtimes" && \
    apk add --no-cache \
    # fail2ban \
    gnupg \
    jq \
    memcached \
    nginx-mod-http-brotli \
    nginx-mod-http-dav-ext \
    nginx-mod-http-echo \
    nginx-mod-http-fancyindex \
    nginx-mod-http-geoip2 \
    nginx-mod-http-headers-more \
    nginx-mod-http-image-filter \
    nginx-mod-http-perl \
    nginx-mod-http-redis2 \
    nginx-mod-http-set-misc \
    nginx-mod-http-upload-progress \
    nginx-mod-http-xslt-filter \
    nginx-mod-mail \
    nginx-mod-rtmp \
    nginx-mod-stream \
    nginx-mod-stream-geoip2 \
    nginx-vim \
    php81-bcmath \
    php81-bz2 \
    php81-dom \
    php81-exif \
    php81-ftp \
    php81-gd \
    php81-gmp \
    php81-imap \
    php81-intl \
    php81-ldap \
    php81-mysqli \
    php81-mysqlnd \
    php81-opcache \
    php81-pdo_mysql \
    php81-pdo_odbc \
    php81-pdo_pgsql \
    php81-pdo_sqlite \
    php81-pear \
    php81-pecl-apcu \
    php81-pecl-memcached \
    php81-pecl-redis \
    php81-pgsql \
    php81-posix \
    php81-soap \
    php81-sockets \
    php81-sodium \
    php81-sqlite3 \
    php81-tokenizer \
    php81-xmlreader \
    php81-xsl \
    whois


FROM builder as FINAL

COPY ./includes/shell_aliases.sh /etc/profile.d/
COPY ./includes/configs/ /etc/nginx/
COPY ./static/html /etc/nginx/html
COPY ./static/images /etc/nginx/html/img

EXPOSE 80 443 8080
