#/bin/sh

count=`ps aux | grep telegraf | grep -v grep | wc -l`
if [ $count == 0 ]; then
    exit 1
fi

count=`ps aux | grep php-fpm7 | grep -v grep | wc -l`
if [ $count == 0 ]; then
    exit 1
fi

count=`ps aux | grep nginx | grep -v grep | wc -l`
if [ $count == 0 ]; then
    exit 1
fi
