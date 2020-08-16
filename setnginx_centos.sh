#!/bin/bash
yum install gcc gcc-c++ make pcre-devel
wget https://cdn.baiscws.net/ngx_compile.tar.gz
tar xzvf ngx_compile.tar.gz
cd cdn/nginx-1.18.0&& ./configure --prefix=/usr/local/nginx --with-pcre=../pcre-8.44 --with-zlib=../zlib-1.2.11 --with-http_ssl_module
make
make install
chmod +x /etc/rc.d/rc.local
ehco "/usr/local/nginx/sbin/nginx" >> /etc/rc.d/rc.local

ln -s /usr/local/nginx/sbin/nginx /usr/bin

systemctl start nginx
systemctl enable nginx
echo 脚本完成...
echo 可以使用nginx -s quit|stop|restart|reload 来管理NginX
echo NginX会在bootup时启动
echo 配置文件在/usr/local/nginx/conf
