#!/usr/bin/env bash

apt-get update
apt-get install openjdk-7-jdk -y

echo "Installing logstash..."
wget -q https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz
tar zxvf logstash-1.4.2.tar.gz
cp /vagrant/logstash.conf .

echo "Creating sample logs..."
echo "mymessage1" > log1.log
echo "mymessage2" > log2.log
echo "mymessage3" > log3.log
echo "mymessage4" > log4.log
echo "mymessage5" > log5.log

echo "Type './logstash.sh' to run logstash"
cp /vagrant/logstash.sh .
chmod 755 logstash.sh
