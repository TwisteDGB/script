#!/bin/bash

# Проверка наличия репозитория Backports
if ! grep -q "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted universe multiverse" /etc/apt/sources.list; then
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted universe multiverse" >> /etc/apt/sources.list
fi

# Обновление пакетного менеджера
apt update

# Установка и запуск Apache2
apt install -y apache2
systemctl start apache2
systemctl enable apache2

# Установка Python
apt install -y python3

# Установка и поднятие SSH-сервера
apt install -y openssh-server
systemctl start ssh
systemctl enable ssh

# Добавление прав администратора
echo "%sudo ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Установка дополнительных полезных программ
apt install -y curl # Установка curl
apt install -y htop # Установка htop
apt install -y git # Установка git
apt install -y vim # Установка Vim

# Вывод сообщения о завершении настройки
echo "Система настроена успешно."
