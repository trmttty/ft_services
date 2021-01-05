#/bin/sh

count=`ps aux | grep docker | grep -v grep | wc -l`
if [ $count != 15 ]; then
	echo if
    exit 1
fi

