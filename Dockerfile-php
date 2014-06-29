FROM centos

# Install Remi and EPEL repos
RUN wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

# Install Memcached
RUN yum --enablerepo=epel,remi install -y php-fpm php-soap php-pear php-gd php-mbstring php-mcrypt php-pecl-apc php-pecl-memcache php-xml php-mysql

# Add the custom www.conf - this allows the connections to work
ADD www.conf /etc/php-fpm.d/www.conf

ENTRYPOINT ["/usr/sbin/php-fpm", "-F"]

#CMD service php-fpm start

# Expose port listed in my.cnf
EXPOSE 9000

# Here's the command to run this and map the correct /srv directory:
# docker run -d -v /srv:/srv:rw -p 9001:9000 phptest1 
