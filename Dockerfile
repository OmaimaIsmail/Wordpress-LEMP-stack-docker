From ubuntu:16.04
RUN apt-get update 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y mysql-server
ADD owner.sh /root/owner.sh
RUN chmod 744 /root/owner.sh
RUN apt-get install -y nginx php-fpm php-mysql php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc curl
WORKDIR /tmp
RUN curl -O https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php && cp -a /tmp/wordpress/. /var/www/html && chown -R www-data:www-data /var/www/html
COPY wp-config.php /var/www/html/wp-config.php
EXPOSE 80 
ENTRYPOINT ["/root/owner.sh"]



