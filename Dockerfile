# Docker image that extends the base with postgres and email packages.
FROM mediawiki:stable
MAINTAINER XSF Editors <editor@xmpp.org>
RUN set -x; \
		apt-get update \
    && apt-get install -y --no-install-recommends \
        libpq-dev \
    && docker-php-ext-install pgsql \
    && rm -rf /var/lib/apt/lists/*

RUN pear channel-update pear.php.net && pear upgrade --force PEAR && pear install mail net_smtp
