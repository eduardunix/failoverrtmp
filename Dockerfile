FROM ubuntu
EXPOSE 1935
EXPOSE 1936
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install libnginx-mod-rtmp -y
RUN apt-get install ffmpeg  x264 x265 -y
RUN apt-get install stunnel4 -y
ADD  scripts /mnt/scripts
RUN mv /mnt/scripts/scripts /usr/share/nginx/scripts
RUN cd /mnt/scripts && ./nginx.sh
RUN mv /mnt/scripts/stunnel/stunnel.conf /etc/stunnel/stunnel.conf
RUN mv /mnt/scripts/stunnel/default/stunnel4 /etc/default/stunnel4
ENTRYPOINT service nginx start && service stunnel4 start &&  bash
