#Установка утилиты Logwatch
sudo apt install logwatch

#Открыть файл /etc/logwatch/conf/logwatch.conf настроить параметры.
Service = sshd
Service = vsftpd
Service = xrdp

#Cоздать новый файл
script.sh
#Cоздать скрипт для отпраки логов 
logwatch --detail "Med" --mailto "bychkov@mail/ru"

#Дать скрипту права
chmod +x script.sh

#Открыть планировщик задач cron
corntab -e

#Добавить задачу 
08 * * * /home/script.sh
