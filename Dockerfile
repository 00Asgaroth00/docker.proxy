FROM alpine:3.21

# This clones the work in our standard in-house base image, but we want this
# container to be stand-alone (and more to the point, be the first thing
# running, so that base can be configured to use this as a package repository).

COPY files/root/. /root

RUN apk --no-cache upgrade \
    && apk --no-cache add "nginx=~1.26" "bash=~5.2" \
    && rm /etc/nginx/http.d/default.conf

# RUN apk --no-cache add "nginx=~1.26"

# copy in nginx configuration files. We do our work in proxy.conf in
# /etc/nginx/conf.d/ but have to remove the default server otherwise it will
# consume port 80 connections.

# RUN rm /etc/nginx/http.d/default.conf
COPY files/etc/nginx/conf.d/proxy.conf /etc/nginx/http.d/proxy.conf

EXPOSE 80

# run in foreground

ENTRYPOINT ["nginx", "-g", "daemon off;"]
