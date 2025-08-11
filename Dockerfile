# 使用 PHP 7.4.3 CLI 版本
FROM php:7.4.3-cli

# 安裝必要套件與 PHP 擴充
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    mariadb-client \
    && docker-php-ext-install zip pdo_mysql

WORKDIR /var/www/html

CMD ["php", "-a"]
