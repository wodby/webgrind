ARG FROM_TAG

FROM wodby/php:${FROM_TAG}

ARG WEBGRIND_VER

USER root

# Actualize confih.php.tpl when updating version.
ENV WEBGRIND_VER="${WEBGRIND_VER}" \
    WEBGRIND_ROOT="${APP_ROOT}/vendor/jokkedk/webgrind"

RUN set -ex; \
    apk add --update --no-cache --virtual .webgrind-rundeps graphviz python3; \
    ln -s /usr/bin/python3 /usr/bin/python; \
    apk add --update --no-cache --virtual .build-deps g++; \
    \
    su-exec www-data composer require jokkedk/webgrind:^${WEBGRIND_VER}; \
    cd "${WEBGRIND_ROOT}"; \
    make; \
    \
    apk del .build-deps; \
    su-exec www-data composer clear-cache

USER www-data

WORKDIR "${WEBGRIND_ROOT}"

COPY config.php.tpl /etc/gotpl/
COPY init /docker-entrypoint-init.d/
COPY actions /usr/local/bin/

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "index.php"]