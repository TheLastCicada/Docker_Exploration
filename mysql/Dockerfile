from ubuntu:12.04

MAINTAINER Zachary Brown <zachary.g.brown@gmail.com>

run apt-get update
run apt-get install -y mysql-server pwgen

ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh

RUN chmod 755 /*.sh

RUN /create_mysql_admin_user.sh

expose 3306 
cmd mysqld
