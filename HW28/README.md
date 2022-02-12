##### 1. Можно ли передать переменную окружения в ansible

Можно, если переменная окружения управляющей машины - через extra vars, если управляемой - через facts

##### 2. Привести пример модуля и плагина в ansible

- модуль - например, ping, apt, file ...
- плагин - lookup, vars, shell

##### 3. Развернуть nginx c lua модулем через ansible, либо установить nginx из source
#####    Проверить работоспособность

здесь про установку с нуля и развёртывание модулей 
https://www.alibabacloud.com/blog/how-to-build-nginx-from-source-on-ubuntu-20-04-lts_597793
ngx_http_lua_module.so 
nginx-1.21.6.tar.gz 
openresty - Будет nginx+lua

sudo /etc/tempnginx/nginx-1.21.6/configure.sh --prefix=/var/www/html --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --with-pcre  --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --with-http_ssl_module --with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules --with-http_v2_module --with-stream=dynamic --with-http_addition_module --with-http_mp4_module


- инсталлируем NGINX
  (роль nginx-install)
- инсталлируем NGINX Developer Kit - NDK  (https://docs.nginx.com/nginx/admin-guide/dynamic-modules/ndk/)
- инсталлируем Lua module








##### 4. Установить  apache jmetr для тестирования нагрузки вебсерверов (лучше сделать через ansible и установить сервер, и воркеры на других машинах)
  - здесь лежит jmeter: https://downloads.apache.org/jmeter/binaries/
  - сделал роль /p4/apachejmeter (пока только ubuntu)
  - ansible-playbook -i myhosts playbookHW28-4.yml 

5. Доделать то, что не завершили на уроке
