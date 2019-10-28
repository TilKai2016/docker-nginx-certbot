FROM really/nginx-certbot

MAINTAINER ti <tilkai2016@163.com>

RUN apk add --update --no-cache tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata
ENTRYPOINT ["docker-entrypoint.sh"]
