FROM php:8.0-fpm

ARG uid 1000
ARG guid 1000

ENV USER www
ENV GROUP www
ENV PORT 9000

# Copy composer.lock and composer.json
COPY ./src/composer.lock ./src/composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for Laravel application and set proper UID/GUID
RUN groupadd -g ${guid} ${USER} && useradd -u ${uid} -ms /bin/bash -g ${GROUP} ${USER}

# Copy existing application directory with proper ownership
COPY --chown=${USER}:${GROUP} ./src /var/www

# Change current user to www
USER ${USER}

# Expose port and start php-fpm server
EXPOSE ${PORT}
CMD ["php-fpm"]