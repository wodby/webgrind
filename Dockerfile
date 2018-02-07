FROM wodby/php:7.1-3.6.0

ARG WEBGRIND_VER

USER root

# Actualize confih.php.tpl when updating version.
ENV WEBGRIND_VER="${WEBGRIND_VER}" \
    WEBGRIND_ROOT="${APP_ROOT}/vendor/jokkedk/webgrind"

RUN set -ex; \
    \
    apk add --update --no-cache --virtual .webgrind-rundeps graphviz python3; \
    apk add --update --no-cache --virtual .build-deps g++; \
    \
    ln -s /usr/bin/python3 /usr/bin/python; \
    su-exec www-data composer require "jokkedk/webgrind:^${WEBGRIND_VER}"; \
    cd "${WEBGRIND_ROOT}"; \
    make; \
    \
    apk del .build-deps; \
    su-exec www-data composer clear-cache; \
    rm -rf /var/cache/apk/*

USER www-data

WORKDIR "${WEBGRIND_ROOT}"

COPY templates /etc/gotpl/
COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "index.php"]