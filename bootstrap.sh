#!/bin/bash
pilih="ok"
DBHOST=localhost
DBNAME=dbsosmed
DBUSER=devopscilsy
DBPASSWD=123456789
read -p "Apakah Kamu Akan Menginstall Webserver & Database Server? Anda Yakin ? (ok/no)" ketik;
if [ $ketik == $pilih ];
then
	echo "Bersiaplah Installasi Webserver & Database Server Akan Dimulai !"
	echo " ----------------------------------------------- "
	echo " Update system Terlebih Dahulu, Mohon Bersabar "
	echo " --------------------------------------------- "
	apt-get update -y
	echo " --------------------------------------------- " 
	echo " Installasi Nginx "
	echo " --------------------------------------------- " 
	apt-get install nginx -y
	echo " --------------------------------------------- " 
	echo " Installasi PHP & Mysql "
	echo " --------------------------------------------- " 
	apt-get install php-fpm php-mcrypt php-cli php-mysql php-gd php-imagick php-recode php-tidy php-xmlrpc
	echo " --------------------------------------------- " 
	echo " Installasi & Konfigurasi Mysql "
	echo " --------------------------------------------- "

	debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
        debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password $DBPASSWD'
	apt-get install mysql-server phpmyadmin -y
        echo -e "\n--- Setting up our MySQL user and db ---\n"
	mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
	mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
	echo " The End "
	exit 0
else 
	echo " Batal - Gak Jadi Install "
	exit 1
fi
