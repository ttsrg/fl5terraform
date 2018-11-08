apt remove nginx* -y
apt purge -y nginx*
#rm -rf /etc/nginx
rm -rf  /var/www/html/index*
apt remove -y php7.0-fpm
apt remove -y git
apt remove -y golang-go
systemctl disable gomain
rm -rf /etc/systemd/system/gomain*
apt remove -y letsencrypt*
apt purge -y letsencrypt*
rm -rf /srv/acme
rm -rf /var/spool/cron/crontabs/root/*
rm -rf  srv/goapp/  /srv/phpapi/  /srv/www/
apt remove -y htop

