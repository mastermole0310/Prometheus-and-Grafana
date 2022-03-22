#!/bin/bash
# Обновление сервера
apt upgrade -y
apt-get update
# Установка ssh подключения
apt install openssh-server -y
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
