#!/bin/sh

WWAN1IP=`ifconfig ppp0 | awk '$1=="inet" && $2!="127.0.0.1"{print $2}'`
if [ "$WWAN1IP" = "" ]; then
	/usr/local/sbin/pfSctl -c 'interface reload wan'
	echo "reloaded WWAN1"
else
	echo $WWAN1IP
fi

WWAN2IP=`ifconfig ppp1 | awk '$1=="inet" && $2!="127.0.0.1"{print $2}'`
if [ "$WWAN2IP" = "" ]; then
	/usr/local/sbin/pfSctl -c 'interface reload opt1'
	echo "reloaded WWAN2"
else
	echo $WWAN2IP
fi

 sleep 10

WWAN3IP=`ifconfig ppp2 | awk '$1=="inet" && $2!="127.0.0.1"{print $2}'`
if [ "$WWAN3IP" = "" ]; then
	/usr/local/sbin/pfSctl -c 'interface reload opt2'
	echo "reloaded WWAN3"
else
	echo $WWAN3IP
fi
