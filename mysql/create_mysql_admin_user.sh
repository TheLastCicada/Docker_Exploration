#!/bin/bash

if [ -f /.mysql_admin_created ]; then
	echo "MySQL 'vagrant' user already created!"
	exit 0
fi

/usr/bin/mysqld_safe > /dev/null 2>&1 &

PASS=$(pwgen -s 12 1)
echo "=> Creating MySQL vagrant user & password"
RET=1
while [[ RET -ne 0 ]]; do
	sleep 5
	mysql -uroot -e "CREATE USER 'vagrant'@'%' IDENTIFIED BY 'vagrant'"
	RET=$?
done

mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'%' WITH GRANT OPTION"

mysqladmin -uroot shutdown

echo "=> Done!"
touch /.mysql_admin_created
