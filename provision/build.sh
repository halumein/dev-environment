#!/bin/bash

PROVISION='/vagrant/provision'

cat ${PROVISION}/mysql.preseed | sudo debconf-set-selections
cat ${PROVISION}/phpmyadmin.preseed | sudo debconf-set-selections
sudo cp ${PROVISION}/apache2.conf /etc/apache2/apache2.conf

sudo apt-get update
sudo apt-get install -y mc apache2 mysql-server php5 phpmyadmin php5-apcu php5-memcache git npm npm-legacy
sudo locale-gen ru_RU.UTF-8
sudo update-locale
sudo /usr/sbin/a2enmod rewrite
sudo npm install -g bower