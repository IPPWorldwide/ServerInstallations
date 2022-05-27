apt-get update
apt-get -y upgrade
apt-get -y install ca-certificates apt-transport-https software-properties-common -y
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
apt-get update -y
apt-get -y install apache2 libapache2-mod-php8.0 php8.0
apt-get -y install php php-common php-xml php-gd php-mbstring php-tokenizer php-json php-bcmath php-zip php-curl -y
systemctl restart apache2
rm -rf /var/www/html/index.html
git clone https://github.com/IPPWorldwide/MerchantPortal.git /var/www/html/