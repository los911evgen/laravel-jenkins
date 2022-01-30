
### 1 Backend from own composer image

FROM php:7.4-fpm as composer

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    unzip \
    gnupg \
    wget \
    libpq-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd zip xml

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# copy source files to /var/www/html
COPY . /var/www/html
WORKDIR /var/www/html
RUN composer install

### 2 Frontend

FROM node AS node

COPY . /var/www/html
COPY --from=composer /var/www/html/vendor /var/www/html/vendor
WORKDIR /var/www/html
RUN npm --version && npm install && npm run prod

### 3 Build app image
FROM php:7.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    unzip \
    gnupg \
    wget \
    libpq-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath gd zip xml

# Set working directory
WORKDIR /var/www/html
COPY --from=node /var/www/html /var/www/html

# copy envs
COPY env.docker /var/www/html/.env

# need to be writable
RUN chown -R www-data:www-data /var/www/html/storage \
    /var/www/html/bootstrap/cache
# first migrations
COPY ./run.sh /tmp    
ENTRYPOINT ["/tmp/run.sh"]
