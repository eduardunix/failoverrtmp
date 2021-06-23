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
ENV STREAMOFF="adicionar rtmp://localhost:1935/v5i8me8h8wysehhv90w7 para live secundaria de backup ou /mnt/scripts/video/video.mp4 para rodar video caso caia a transmissão"
ENV RTMPSERVER="ADICIONE AQUI A URL DO SERVIDOR RTMP PARA AONDE A TRANSMISSÂO VAI SER ENVIADA"
ENTRYPOINT service nginx start && service stunnel4 start &&  bash
