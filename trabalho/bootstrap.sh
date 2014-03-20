#!/bin/bash

echo "Iniciando a restauração do backup, pode levar vááários minutos"
echo ""

echo ""
echo "Instalando vários pacotes"
echo ""
# PHP e devs
apt-get install -y apache2 php5 php-auth php-codecoverage php-invoker php-pear curl php5-curl php5-imagick php5-mcrypt php5-mysql php5-pgsql php5-sqlite php5-xdebug phpmyadmin mysql-client-5.5 mysql-server-5.5 mysql-workbench mysql-utilities openjdk-7-jdk git gitk fabric
echo "- Ok"
echo ""

echo "Criando link simbólico para libudev.so (Util para instalar o Koala)"
ln -sf /lib/i386-linux-gnu/libudev.so.1 /lib/i386-linux-gnu/libudev.so.0
echo ""
echo "- Ok"
echo ""

echo "Instalando Java para navegadores"
echo ""
apt-get install icedtea-7-plugin icedtea-netx icedtea-netx-common 
echo "- Ok"
echo ""

echo "Copiando o conteúdo de www (Demora pacas)"
echo ""
# www 
cp -r www/* /var/www
echo "- Ok"
echo ""

echo "copiando o conteúdo de opt"
echo ""
#OPTs
cp -r opt/* /opt
echo "- Ok"
echo ""

echo "Aplicando Permissões em pastas"
echo ""
chmod -R 777 /opt
chmod -R 777 /var/www
echo "- Ok"
echo ""

echo "Alterando de usuário"
echo ""
su andre
echo "- Ok"
echo ""

echo "Copiando os conteúdos de home (Demora pacas)"
echo ""
cp -rf home/Documents /home/andre
cp -rf home/Downloads /home/andre
cp -rf home/Mesa /home/andre
cp -rf home/Pictures /home/andre
cp -rf home/Videos /home/andre
cp -rf home/Desktop /home/andre

mkdir -p /home/andre/.thunderbird
cp home/email/profiles.ini /home/andre/.thunderbird/
cp home/email/g3rkqv7n.default /home/andre.thunderbird/
echo "- Ok"
echo ""

echo "Configurando Git"
echo ""
git config --global user.email "andrecardosodev@gmail.com"
git config --global user.name "Andre Cardoso"
git config --global push.default matching
git branch --set-upstream-to=origin/master
git config --global color.ui true
echo "- Ok"
echo ""

echo "Criando a chaves SSH"
echo ""
ssh-keygen -t rsa
echo ""


echo ""
echo "FINALIZADA! Tudo está como antes, exceto o mod_rewrite do apache, configure por favor..."

