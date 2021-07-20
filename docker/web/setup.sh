set -xe

# Hustoj basic file system
useradd -m -u 1536 judge
mkdir -p /home/judge/data
mkdir -p /var/log/hustoj/
mv /trunk/ /home/judge/src/
chmod -R 700 /home/judge/src/web/include/
chown -R www-data:www-data /home/judge/data
chown -R www-data:www-data /home/judge/src/web

# Adjust system configuration
cp /home/judge/src/install/default.conf  /etc/nginx/sites-available/default
sed -i "s#127.0.0.1:9000#unix:/var/run/php/php7.2-fpm.sock#g"    /etc/nginx/sites-available/default

# pym nginx start 添加docker中，nginx上传题库的大小限制
if grep "client_max_body_size" /etc/nginx/nginx.conf ; then 
	echo "client_max_body_size already added" ;
else
	sed -i "s:include /etc/nginx/mime.types;:client_max_body_size    1024m;\n\tinclude /etc/nginx/mime.types;:g" /etc/nginx/nginx.conf
fi
# pym nginx end