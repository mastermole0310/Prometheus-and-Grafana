#!/bin/bash
# Обновление сервера
apt-get update
apt upgrade -y
# Установка jq
apt install jq -y
# Установка ssh подключения
apt install openssh-server -y
# Установка cron
apt install cron
apt autoremove -y
# Включение службы ssh
systemctl enable ssh
# Установка docker
apt install docker.io -y 
# Запуск docker deamon
systemctl start docker
# Создание (добавление) группы docker 
groupadd docker
# Добавление пользователя ec2-user в группу docker
usermod -aG docker ubuntu
# Скачивание и сохранение файл docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Задаем разрешения, чтобы сделать команду docker-compose исполняемой
chmod +x /usr/local/bin/docker-compose
# Добавляем символьную ссылку в /usr/bin.
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# Запускаем файл docker-compose.yml
docker-compose -f /tmp/docker-compose.yml up -d
# Делаем файл temp.sh исполняемым
chmod +x /tmp/temp.sh
# Отправка метрик в Pushgateway
crontab -l 2>/dev/null; echo '* * * * * /tmp/temp.sh' | crontab -

