# HomeWork 16
Срок до 09.12.2021

##### 1) создать пользователя и группу

sudo adduser user1
sudo groupadd usergroup
sudo usermod -g usergroup user1

##### 2) создать сервис (функционал на ваше усмотрение)

Файл - /etc/systemd/system/my.service :

[Unit]
Description = Backups folder /test1/* to /test2

[Service]
RemainAfterExit=true
ExecStop=/usr/local/bin/my_service
Type=oneshot

[Install]
WantedBy=multi-user.target

файл - /usr/local/bin/my_service :

 #!/bin/bash
 cp -R /test1/* /test2

##### 3) разрешить только созданной группе перезапускать этот сервис)

Создаю файл: sudo visudo /etc/sudoers.d/usergroup
Содержимое файла:

%usergroup ALL=(root) NOPASSWD: /bin/systemctl restart my.service

После этого sudo systemctl restart my.service от пользователя user1 работает. Другие команды (start, stop) не работают, нет прав.

##### Написать bash скрипт, который будет выводить следующую информацию:
- 1) Тип ОС
- 2) Имя ос
- 3) Версия ядра
- 4) Ip адрес
- 5) LA за последние 15 минут
- 6) Время работы системы
- 7) Информацию об использованной RAM
- 8) Информацию об авторизованных пользователях
##### Скрипт должен отрабатывать при подключении по ssh и выводить данную информацию в консоль.

Скрипт hw16.sh:

 #!/bin/bash	
echo -n $(lsb_release -is)" "	
echo -n $(lsb_release -cs)" "	
echo $(uname -r)	
echo $(hostname -I)	
echo 'Load Average (15 min):' $(uptime |awk '{print $10;}') $(uptime -p)	
echo 'Used memory:' $(free -h| grep "Mem" | awk '{print $3;}')	
echo 'Users:' $(who -q)	
echo	

В файле ~/.bashrc
добавил строку:  /home/sergey/HW/hw16.sh
(будет отрабатывать при любом входе в терминал в т.ч. через ssh)
или
создать файл (если нет) /etc/ssh/sshrc и добавить такую же строчку туда -
скрипт будет работать только при входе по ssh

Результат работы при подключении по ssh:

Ubuntu focal 5.11.0-40-generic	
192.168.31.9	
Load Average (15 min): 0,13, up 4 days, 22 hours, 35 minutes	
Used memory: 1,6Gi	
	
