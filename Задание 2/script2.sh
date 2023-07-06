#!/bin/bash

# Определяем директории и файлы для резервного копирования
backup_dir="/home /etc/ssh /etc/xrdp /etc/vsftpd /var/log"
backup_dest="/archive"
backup_file="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Создаем временную директорию для бэкапа
tmp_dir=$(mktemp -d)

# Создаем архив с помощью tar
tar -czvf "$tmp_dir/$backup_file" $backup_dir

# Перемещаем бэкап в целевую директорию
mv "$tmp_dir/$backup_file" "$backup_dest"

# Удаляем временную директорию
rm -rf "$tmp_dir"

# Выводим сообщение об успешном завершении
echo "Резервное копирование завершено успешно."

#Cоздаем задачу для запуска скрипта
30 18 * * 5 /home/script2.sh