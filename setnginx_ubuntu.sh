#!/bin/bash
apt update
apt install unar
apt install build-essential
apt install wget
wget https://cdn.baiscws.net/ngx_compile.tar.gz
unar ngx_compile.tar.gz
./cdn/nginx-1.18.0/configure --prefix=/usr/local/nginx \
--with-openssl=./cdn/openssl-1.1.1g --with-pcre=./cdn/pcre-8.44 \
--with-zlib=./cdn/zlib-1.2.11 --with-http_ssl_module
make
make install

[Unit]\
Description=NginX Service\
After=network.target\
\
[Service]\
Type=forking\
User=root\
Group=root\
ExecStart=/usr/local/nginx/sbin/nginx\
ExecStop=/usr/local/nginx/sbin/nginx -s stop\
ExecReload=/usr/local/nginx/sbin/nginx -s reload\
\
[Install]\
WantedBy=multi-user.target > /etc/systemd/system/nginx.service

ln /usr/local/nginx/sbin/nginx /usr/bin

chmod 755 /etc/systemd/system/nginx.service
systemctl start nginx
systemctl enable nginx
echo 脚本完成...
echo 您可以使用service nginx start|stop|reload|restart等对nginx service进行操作
echo 配置文件在/usr/local/nginx/conf
