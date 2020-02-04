sudo -s

mkdir -p /etc/ssl/nginx

mv /tmp/nginx-repo.crt /etc/ssl/nginx/
mv /tmp/nginx-repo.key /etc/ssl/nginx/

wget http://nginx.org/keys/nginx_signing.key && sudo apt-key add nginx_signing.key

apt-get -y install dialog apt-utils

apt-get -y install apt-transport-https lsb-release ca-certificates

printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-plus.list

wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx

apt-get -y update 
apt-get -y install nginx-plus 

nginx -v

mv /tmp/dns_lb.conf /etc/nginx/conf.d/
mv /tmp/api_access.conf /etc/nginx/conf.d/

