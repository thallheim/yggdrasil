FROM nginx:stable-alpine as builder

LABEL maintainer="Thallheim <thall@thallheim.com"
LABEL vendor="Thallheim Industries"
LABEL license="MIT"
LABEL url="https://https://github.com/thallheim/yggdrasil"

COPY ./includes/shell_aliases.sh /etc/profile.d/
COPY ./includes/configs/ /etc/nginx/
COPY ./static/html /etc/nginx/html
COPY ./static/images /etc/nginx/html/img
COPY ./ssl/ /etc/ssl/certs/nginx

EXPOSE 80 443 8080
