#!/bin/bash
# run with sudo

yum -y upgrade
yum -y install git
yum -y install *openjdk-devel
yum -y install tomcat6
yum -y install tomcat6-admin-webapps

yum -y install gcc gcc-c++ make libxslt fop ncurses-devel openssl-devel unixODBC unixODBC-devel

mkdir ~/work
cd ~/work

# install erlang
wget http://www.erlang.org/download/otp_src_R14B04.tar.gz
gunzip *.gz
tar -xf *.tar
cd otp_src_R14B04
 ./configure
make
make install

# install couchdb
git clone git://gist.github.com/1522728.git
cd 1522728
chmod +x couchdb-ec2-install.sh 
./couchdb-ec2-install.sh 

# install rabbitmq
git clone git://gist.github.com/1522766.git
cd 1522766
chmod +x rabbitmq-install.sh 
./rabbitmq-install.sh 

# add tomcat6 and rabbitmq to auto start, couchdb is already set
chkconfig --level 345 tomcat6 on
chkconfig --level 345 rabbitmq-server on


