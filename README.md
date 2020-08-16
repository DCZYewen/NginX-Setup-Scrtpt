# NginX Setup Script

如果你因为配置文件的调整频繁的输入`/usr/local/nginx/sbin/nginx -s reload`，并且觉得不厌其烦的时候；
如果你因为Ubuntu 18后默认章rc.local移除了而找不到明确方法将NginX开机自启的时候；
当你因为每次编译NginX时都要输入复杂且重复的编译选项的时候，
这个脚本或许能帮帮你。

## Ubuntu
使用方法：
`bash <(curl -s -L https://raw.githubusercontent.com/DCZYewen/NginX-Setup-Scrtpt/master/setnginx_ubuntu.sh)`
或者好记一点但是不保证再任何版本的Ubuntu上都能使用
`bash <(curl -s -L http://tinyurl.com/yxhdqvfa)`
可以使用service nginx start|stop|restart|reload来管理NginX或者
使用systemctl start|stop|restart|reload nginx

## CentOS
由于CentOS的奇妙特性，它的依赖项实在是太老旧了，我不得不修改了几处脚本来适应
`bash <(curl -s -L https://raw.githubusercontent.com/DCZYewen/NginX-Setup-Scrtpt/master/setnginx_centos.sh)`
或者
`wget http://tinyurl.com/yy849jpe && mv yy849jpe ngx.sh && chmod +x ngx.sh && bash ngx.sh`
可以使用nginx -s quit|stop|restart|reload 来管理NginX
NginX会开机自启动
