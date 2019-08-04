#!/bin/sh

if [ "$NGINX_HOSTNAME" ]; then
	f=$(cat /etc/nginx/conf.d/default.conf)
	f=$(echo "${f/server_name localhost/server_name $NGINX_HOSTNAME}")
	echo "$f" > /etc/nginx/conf.d/default.conf
fi

if [ "$MAGENTO_HOST_RUN_CODES" ]; then
	MAGENTO_NGINX_RUN_CODE_MAP=$(echo "$MAGENTO_HOST_RUN_CODES" | tr ',' '; ' | tr ':' ' ' )
	MAGENTO_NGINX_MAP=$(echo "map \$http_host \$MAGE_RUN_CODE { default ''; $MAGENTO_NGINX_RUN_CODE_MAP;}")
	MAGENTO_NGINX_FASTCGI_MAP='fastcgi_param  MAGE_RUN_CODE $MAGE_RUN_CODE'
	f=$(cat /etc/nginx/conf.d/default.conf)
	f=$(echo "${f/'#nginx_map'/$MAGENTO_NGINX_MAP}")
	f=$(echo "${f/'#fastcgi_nginx_map'/$MAGENTO_NGINX_FASTCGI_MAP}")
	echo "$f" > /etc/nginx/conf.d/default.conf
fi
