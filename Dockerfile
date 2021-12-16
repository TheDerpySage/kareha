# Dockerfile to setup Kareha
FROM ubuntu/apache2:2.4-20.04_beta
# Set Timezone (Change as needed)
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y \
    perl \
    libapache2-mod-perl2 \
    libcgi-session-perl \
    libcgi-pm-perl \
    imagemagick
# Remove default index
RUN rm /var/www/html/index.html
# Copy Files
COPY app/ /var/www/html/
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
# Enable perl
RUN a2enmod cgid
# Resolve some minor issues 
RUN mkdir /var/www/html/res /var/www/html/src /var/www/html/thumb
RUN sed -e '/Alias/s/^/#/g' -i /etc/apache2/mods-enabled/alias.conf
# Set Permissions
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html
