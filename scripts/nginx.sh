#!/bin/bash 

COMANDO="push"
TWITCH="rtmp://SERVIDOR DESTINO"
#EXEMPLO CONTEUDO FACEBOOKrtmp://127.0.0.1:1936/rtmp/CHAVE_AQUI CASO NAO FOR USAR DEIXE UM #
FACEBOOK="#"
#CONTEUDO COMANDOFACEBOOK push CASO NAO FOR USAR DEIXE UM #
COMANDOFACEBOOK="#"


echo "user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

error_log /var/log/nginx/error.log debug;

events {
  worker_connections 1024;
}


rtmp {


        server {
                listen 1935;
                ping 1s;
                ping_timeout 5s;
                exec_static /usr/share/nginx/scripts/nginx_start.sh;

                application live {
                        live on;
                        idle_streams off;
                        drop_idle_publisher 5s;

                        exec_publish /usr/share/nginx/scripts/publish_start.sh;
                        exec_publish_done /usr/share/nginx/scripts/publish_stop.sh;
                }

                application v5i8me8h8wysehhv90w7 {
                        live on;
                        }

                application live2 {
                         live on;
			 allow 127.0.0.1;
			 deny all;
                         $COMANDO $TWITCH;
			 $COMANDOFACEBOOK $FACEBOOK;
                }
        }
}" > /etc/nginx/nginx.conf

