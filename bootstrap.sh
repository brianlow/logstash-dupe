#!/usr/bin/env bash

apt-get update
apt-get install openjdk-7-jdk -y

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
