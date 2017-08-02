FROM wodby/php:7.1

# Actualize confih.php.tpl when updating version.
ENV WEBGRIND_VER="1.5" \
    WEBGRIND_ROOT="${APP_ROOT}/vendor/jokkedk/webgrind"

RUN apk add --update --no-cache --virtual .webgrind-rundeps graphviz && \
    apk add --update --no-cache --virtual .build-deps g++ && \
    su-exec www-data composer require jokkedk/webgrind:^${WEBGRIND_VER} && \
    cd "${WEBGRIND_ROOT}" && \
    make && \
    apk del .build-deps && \
    su-exec www-data composer clear-cache

WORKDIR "${WEBGRIND_ROOT}"

COPY config.php.tpl /etc/gotpl/
COPY init /docker-entrypoint-init.d/

CMD ["php", "-S", "0.0.0.0:8080", "index.php"]