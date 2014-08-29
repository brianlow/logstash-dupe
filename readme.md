
Reproduction of issue https://github.com/elasticsearch/logstash/issues/1675

    vagrant up                              # apt-get logstash, create 5 log files with 1 message each
    vagrant ssh
    
    sleep 60                                # wait for logstash to parse
    sudo cat /var/log/upstart/logstash.log  # logstash found all 5 messages
    # 2014-08-29T21:39:50.637+0000 precise32 mymessage1
    # 2014-08-29T21:39:50.642+0000 precise32 mymessage4
    # 2014-08-29T21:39:50.648+0000 precise32 mymessage5
    # 2014-08-29T21:39:50.651+0000 precise32 mymessage2
    # 2014-08-29T21:39:50.664+0000 precise32 mymessage3

    sudo service logstash restart
    
    sleep 60                                # wait for logstash to re-parse files
    sudo cat /var/log/upstart/logstash.log  # we see 9 events but only expected the original 5
    # 2014-08-29T21:39:50.637+0000 precise32 mymessage1
    # 2014-08-29T21:39:50.642+0000 precise32 mymessage4
    # 2014-08-29T21:39:50.648+0000 precise32 mymessage5
    # 2014-08-29T21:39:50.651+0000 precise32 mymessage2
    # 2014-08-29T21:39:50.664+0000 precise32 mymessage3
    # 2014-08-29T21:40:39.647+0000 precise32 mymessage4
    # 2014-08-29T21:40:39.652+0000 precise32 mymessage5
    # 2014-08-29T21:40:39.660+0000 precise32 mymessage2
    # 2014-08-29T21:40:39.665+0000 precise32 mymessage3    

	cat /var/lib/logstash/.sincedb*         # sincedb only records 1 out of 5 files
	# 524303 0 64512 11

	