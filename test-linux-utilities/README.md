- 1) Скачать git репу https://github.com/hashicorp/vagrant, используя curl


- 2) Сгенерировать 4к ssh ключи и залить на удаленный сервер
>  ssh-keygen -b 4096
>  ssh-copy-id user_name@remote_host

- 3) Download file if it was changed after 31-Jan-18
 http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

wget 

- 4) Download file with limited speed 50K
http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml

> wget http://ftp.byfly.by/pub/CentOS/7/updates/x86_64/repodata/repomd.xml --limit-rate=50K

- 5) Создать файл в директории /opt и не спускаясь из текущей директории найти данный файл и удалить в одну команду

> sudo find / -maxdepth 2 -name 123file -delete

- 6) Найти в директории, например /tmp или /var пустые файлы

> sudo find /var -type f -empty


7*) Рассказать отличие < от |
например grep bash < file /bin/*
file /bin/* | grep bash


- 8)Изменить цвет и размер шрифта по умолчанию в консоли вашего пользователя.

> nano ~/.bashrc
> менять здесь


- 9)Вывести информацию о созданном файле в отдельный файл txt.

> ls -l newfile  >infofile.txt 

- 10)Добавить к переменной среды PATH путь к домашней папке пользователя.

> export PATH=$PATH:/home/sergey 

- 11) Пронумеровать строчки системного лога.



12) Посмотреть первые 10 событий любого журнала.
13) Найти в домашней папке все файлы, начинающиеся с букв "a" по "z" (если нет - создать) и скопировать их в папку temp в домашнем "каталоге".
14) Запустить диспетчер задач top в фоновом режиме.
15) Найти в журналах событий /var/log логи, содержащие ваш логин.
