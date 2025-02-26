# # pull base image
# FROM debian:bullseye

# # update and upgrade
# RUN apt-get update && apt-get upgrade -y

# # install adminer
# RUN apt-get install -y\
# 					wget\
# 					netcat\
# 					php\
# 					php7.4


# COPY ./conf/adminer.sh ./

# RUN chmod +x adminer.sh

# RUN mkdir -p /var/www/adminer


# EXPOSE 8080

# # ENTRYPOINT ["cd", "/var/www/adminer", ";", "php", "-S", "0.0.0.0:8080"]

# ENTRYPOINT ["/adminer.sh"]

# Pull base image
FROM debian:bullseye

# Update system and install required packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    netcat \
    php-cli \
    php-mbstring \
    php-mysqli \
    php-curl \
    php-xml \
    php-zip \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Create Adminer directory
RUN mkdir -p /var/www/adminer

# Copy the startup script
COPY ./conf/adminer.sh /adminer.sh
RUN chmod +x /adminer.sh

# Expose port 8080
EXPOSE 8080

# Run the startup script at container launch
ENTRYPOINT ["./adminer.sh"]
