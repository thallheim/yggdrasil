FROM nginx:stable-alpine

LABEL maintainer=Thallheim<thall@thallheim.com


# COPY ./includes/nginx.conf /etc/nginx/nginx.conf
COPY ./includes/ /etc/nginx/
COPY ./static/html /etc/nginx/html
COPY ./static/images /etc/nginx/html/img
COPY ./ssl/ /etc/ssl/certs/nginx

EXPOSE 80 443 8080

RUN alias l='ls -lAh' # Why u no work?
