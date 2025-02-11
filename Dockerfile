FROM php:8.1-fpm

# Instala dependencias básicas y extensiones de PHP para Laravel
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    unixodbc-dev \
    gnupg2 \
    apt-transport-https

# Instalar Composer globalmente
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"


# En lugar de importar la clave y usar el archivo de Microsoft,
# creamos una entrada en sources.list marcando el repositorio como confiable.
RUN echo "deb [trusted=yes] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17

# Instala los drivers para SQL Server y habilítalos
RUN pecl install sqlsrv pdo_sqlsrv && docker-php-ext-enable sqlsrv pdo_sqlsrv

WORKDIR /workspace
