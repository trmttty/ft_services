FROM	alpine

# RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
# RUN		apk update && apk add --no-cache nginx

RUN		apk update && \
		apk add --no-cache nginx openssl wget php7-fpm php7-common php7-iconv php7-mbstring php7-json php7-session php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
		rm -f /etc/nginx/conf.d/default.conf && \
		mkdir -p /run/nginx

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

WORKDIR	/tmp/
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& tar -xvzf phpMyAdmin-5.0.2-all-languages.tar.gz \
		&& mv phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin

WORKDIR	/
RUN		mkdir /etc/nginx/ssl \
		&& openssl genrsa -out /etc/nginx/ssl/private.key 2048 \
		&& openssl req -new -key /etc/nginx/ssl/private.key -out /etc/nginx/ssl/server.csr -subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=/CN=localhost" \
		&& openssl x509 -days 365 -req -signkey /etc/nginx/ssl/private.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/pma-nginx.conf		/etc/nginx/conf.d/default.conf
COPY	/srcs/config.inc.php		/var/www/phpmyadmin/
COPY	/srcs/start.sh				/
COPY	/srcs/healthcheck.sh		/

RUN		chmod 644 /var/www/phpmyadmin/config.inc.php

EXPOSE	5000

ENTRYPOINT sh start.sh
