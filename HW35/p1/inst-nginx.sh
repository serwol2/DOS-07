#!/bin/bash

sudo apt update && sudo apt install -y nginx && sudo chmod 777 /var/www/html/index.nginx-debian.html && \
echo "<!DOCTYPE html> \
<html>\
\<head>\
<title>Welcome to nginx!</title>\
<style>\
    body {\
        width: 35em;\
        margin: 0 auto;\
        font-family: Tahoma, Verdana, Arial, sans-serif;\
    }\
</style>\
</head>\
<body>\
<h1>Welcome to nginx!</h1>\
<h1>This is a modified page!!!</h1>\
<p>If you see this page, the nginx web server is successfully installed and\
working. Further configuration is required.</p>\
<p>For online documentation and support please refer to\
<a href="http://nginx.org/">nginx.org</a>.<br/>\
Commercial support is available at\
<a href="http://nginx.com/">nginx.com</a>.</p>\
<p><em>Thank you for using nginx.</em></p>\
</body>\
</html>" > /var/www/html/index.nginx-debian.html
