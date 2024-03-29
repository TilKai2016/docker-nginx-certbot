# tilkai/docker-nginx-certbot
1. 基于really/nginx-certbot基础上添加东八区时区支持。
2. 定时任务脚本文件renewLetsEncrypt.sh。


## really/nginx-certbot
[GitHub](https://github.com/reallyreally/docker-nginx-certbot) of really/nginx-certbot
Docker container providing [nginx](https://www.nginx.com) with [lua](https://www.nginx.com/resources/wiki/modules/lua/) and certbot for [Let's Encrypt](https://letsencrypt.org) SSL certificates

[![](https://images.microbadger.com/badges/image/really/nginx-certbot.svg)](https://microbadger.com/images/really/nginx-certbot "Get your own image badge on microbadger.com") [![GitHub issues](https://img.shields.io/github/issues/reallyreally/docker-nginx-certbot.svg?style=flat-square)](https://github.com/reallyreally/docker-nginx-certbot/issues) [![GitHub license](https://img.shields.io/github/license/reallyreally/docker-nginx-certbot.svg?style=flat-square)](https://github.com/reallyreally/docker-nginx-certbot/blob/master/LICENSE) [![Docker Pulls](https://img.shields.io/docker/pulls/really/nginx-certbot.svg?style=flat-square)](https://github.com/reallyreally/docker-nginx-certbot/)

Launch nginx using the default config:
```
docker run --name nginx-certbot \
  --restart=always \
  --net=host \
  -v /data/nginx/conf.d:/etc/nginx/conf.d:rw \
  -v /data/letsencrypt:/etc/letsencrypt:rw \
  -p 80:80 -p 443:443 -d \
  really/nginx-certbot
```

Certbot
-------
Easily add SSL security to your nginx hosts with certbot.
`docker exec -it nginx-certbot /bin/sh` will bring up a prompt at which time you can `certbot` to your hearts content.

_or_

`docker exec -it nginx-certbot certbot --no-redirect --must-staple -d example.com`

It even auto-renew's for you every day!
