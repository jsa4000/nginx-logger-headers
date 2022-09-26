FROM openresty/openresty:1.21.4.1-3-alpine

EXPOSE 8080
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

RUN chgrp -R 0 /usr/local/openresty/nginx/ && \
    chmod -R g=u /usr/local/openresty/nginx/

