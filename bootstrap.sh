#!/usr/bin/env bash

apt-get update

echo "---"
echo "Installing Oracle Java 7..." 
# http://stackoverflow.com/questions/16263556/installing-java-7-on-ubuntu
# http://stackoverflow.com/questions/19275856/auto-yes-to-the-license-agreement-on-sudo-apt-get-y-install-oracle-java7-instal
apt-get install python-software-properties -y
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get install oracle-java7-installer -y
apt-get install oracle-java7-set-default -y
java -version

echo "Installing logstash..."
wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
sh -c 'echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" >> /etc/apt/sources.list'
apt-get update
apt-get install logstash -y
cp /vagrant/logstash.conf /etc/logstash/conf.d/
echo 'LS_OPTS="--debug"' >> /etc/default/logstash

echo "Creating sample logs..."
echo "mymessage1" > log1.log
echo "mymessage2" > log2.log
echo "mymessage3" > log3.log
echo "mymessage4" > log4.log
echo "mymessage5" > log5.log

echo "Starting logstash..."
service logstash start
