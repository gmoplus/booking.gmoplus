FROM webdevops/php-apache:8.2

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Create required directories and set permissions
RUN mkdir -p /app/tmp/compile /app/tmp/cache /app/tmp/upload /app/files \
    && chmod -R 777 /app/tmp \
    && chmod -R 755 /app/files \
    && chown -R www-data:www-data /app

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set Apache document root
ENV WEB_DOCUMENT_ROOT=/app

# Expose port 80
EXPOSE 80
