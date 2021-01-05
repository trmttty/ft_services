#/bin/sh

count=`ps aux | grep telegraf | grep -v grep | wc -l`
if [ $count != 1 ]; then
    exit 1
fi

count=`ps aux | grep sshd | grep -v grep | wc -l`
if [ $count != 1 ]; then
    exit 1
fi

count=`ps aux | grep nginx | grep -v grep | wc -l`
if [ $count != 2 ]; then
    exit 1
fi
