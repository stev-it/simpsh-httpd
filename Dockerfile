FROM frolvlad/alpine-bash
RUN apk --no-cache add socat git \ 
&& apk add dos2unix --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
&& mkdir /app \
&& cd /app \
&& git clone https://github.com/stev-it/simpsh-httpd /app \
&& chmod -R a+x *

VOLUME /app
CMD ["/app/start-socat.sh","-d","&&","sleep","infinity"]

