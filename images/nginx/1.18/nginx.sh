#!/bin/sh

NGINX_CONF=$(cat /etc/nginx/conf.d/default.conf)

if [ "$NGINX_HOSTNAME" ]; then
  NGINX_CONF=$(echo "$NGINX_CONF" | sed "s/server_name localhost/server_name ${NGINX_HOSTNAME}/")
fi

if [ "$MAGENTO_HOST_RUN_CODES" ]; then
  MAGENTO_NGINX_RUN_CODE_MAP=$(echo "$MAGENTO_HOST_RUN_CODES" | tr ',' ';' | tr ':' ' ' )
  MAGENTO_NGINX_MAP=$(echo "map \$http_host \$MAGE_RUN_CODE { default '';$MAGENTO_NGINX_RUN_CODE_MAP;}")
  MAGENTO_NGINX_FASTCGI_MAP='fastcgi_param  MAGE_RUN_CODE $MAGE_RUN_CODE;'
  NGINX_CONF=$(echo "$NGINX_CONF" | sed "s/#nginx_map/${MAGENTO_NGINX_MAP}/")
  NGINX_CONF=$(echo "$NGINX_CONF" | sed "s/#fastcgi_nginx_map/${MAGENTO_NGINX_FASTCGI_MAP}/")
fi

echo "$NGINX_CONF" > /etc/nginx/conf.d/default.conf