#!/bin/bash
# run with sudo

yum -y upgrade
yum -y install git
yum -y install *openjdk-devel
yum -y install tomcat6
yum -y install tomcat6-admin-webapps

#yum -y install ruby
#yum -y install ruby-devel ruby-docs ruby-ri ruby-rdoc
#yum -y install rubygems

yum -y install gcc gcc-c++ make libxslt fop ncurses-devel openssl-devel unixODBC unixODBC-devel

mkdir ~/work

# install erlang
cd ~/work
wget http://www.erlang.org/download/otp_src_R15B01.tar.gz
gunzip *.gz
tar -xf *.tar
cd otp_src_R15B01
 ./configure
make
make install

# install riak
cd ~/work
git clone git://github.com/neuhausler/ec2riak
cd ec2riak
chmod +x install.sh 
./install.sh 

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

# install cloudrover
cd ~/work
git clone git://github.com/neuhausler/ec2cloudrover
cd ec2cloudrover
chmod +x install.sh 
./install.sh 

# install cloudproxy
cd ~/work
git clone git://github.com/neuhausler/ec2cloudproxy
cd ec2cloudproxy
chmod +x install.sh 
./install.sh 

# enable auto start
chkconfig --level 345 cloudrover on
# chkconfig --level 345 tomcat6 on
# chkconfig --level 345 couchdb on
# chkconfig --level 345 riak on
# chkconfig --level 345 rabbitmq-server on
# chkconfig --level 345 cloudproxy on

# do some cleaning up
cd ~/work
rm -rf *

