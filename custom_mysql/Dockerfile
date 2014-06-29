FROM centos

# Install Remi and EPEL repos
RUN wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

# Install MySQL
RUN yum --enablerepo=epel,remi install -y mysql-server

# Add the custom my.cnf
#ADD www.conf /etc/php-fpm.d/www.conf

CMD service mysqld start

# Expose port listed in my.cnf
EXPOSE 3600

# Here's the command to run this and map the correct /srv directory:
# docker run -d -v /var/lib/mysql:/var/lib/mysql:rw -p 3600:3600 phptest1 
