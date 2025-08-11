# 使用 PHP 7.4.3 CLI 版本
FROM php:7.4.3-cli

# 更新 sources.list 指向 archive.debian.org，並安裝必要套件與 PHP 擴充
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && apt-get install -y \
      libzip-dev \
      zip \
      unzip \
      default-mysql-client \
      build-essential \
      autoconf \
      pkg-config \
      libc6-dev \
      libssl-dev && \
    docker-php-ext-install zip pdo_mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

CMD ["php", "-a"]
