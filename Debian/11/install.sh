apt-get update
sudo su -c "echo 'Dpkg::Options { "--force-confnew"; };' >> /etc/apt/apt.conf.d/71debconf"
apt-get -y upgrade
apt-get -y install ca-certificates apt-transport-https software-properties-common -y
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
apt-get update -y
apt-get -y install apache2 libapache2-mod-php8.0 php8.0
apt-get -y install php php-common php8.0-xml php8.0-gd php8.0-mbstring php-tokenizer php8.0-bcmath php8.0-zip php8.0-curl unzip -y
systemctl restart apache2
rm -rf /var/www/html/index.html
git clone https://github.com/IPPWorldwide/MerchantPortal.git /var/www/html/
chown -R www-data /var/www/html/
chgrp -R www-data /var/www/html/
