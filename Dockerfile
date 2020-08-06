FROM php:7.3-fpm
MAINTAINER Matthieu DA CONCEICAO

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        gnupg

RUN apt-get update && \
    apt-get install -y \
        openssh-client \
        curl \
        git \
        git-ftp
		
# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install PHP Code sniffer
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
RUN mv phpcs.phar /usr/local/bin/phpcs
RUN chmod a+x /usr/local/bin/phpcs

# Install PHP Lint
RUN curl -OL https://raw.githubusercontent.com/overtrue/phplint/master/bin/phplint
RUN mv phplint /usr/local/bin/phplint
RUN chmod a+x /usr/local/bin/phplint
