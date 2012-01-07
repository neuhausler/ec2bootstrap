#!/bin/bash
# run with sudo

yum -y upgrade
yum -y install git
yum -y install *openjdk-devel
yum -y install tomcat6
yum -y install tomcat6-admin-webapps

yum -y install gcc gcc-c++ make libxslt fop ncurses-devel openssl-devel unixODBC unixODBC-devel

mkdir ~/work

# install erlang
cd ~/work
wget http://www.erlang.org/download/otp_src_R14B04.tar.gz
gunzip *.gz
tar -xf *.tar
cd otp_src_R14B04
 ./configure
make
make install

# install couchdb
cd ~/work
git clone git://github.com/neuhausler/ec2couchdb
cd ec2couchdb
chmod +x install.sh 
./install.sh 

# install rabbitmq
cd ~/work
git clone git://github.com/neuhausler/ec2rabbitmq
cd ec2rabbitmq
chmod +x install.sh 
./install.sh 

# add tomcat6 and rabbitmq to auto start, couchdb is already set
chkconfig --level 345 tomcat6 on
chkconfig --level 345 rabbitmq-server on

# do some cleaning up
cd ~/work
rm -rf *

