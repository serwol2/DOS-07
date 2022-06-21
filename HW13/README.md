# HomeWork-13

## Task_1
- 1) configure X11 on ssh
- 2) connect to vm using graphical interface via ssh

>На стороне сервера устанавливаем apt install xauth
>Добавить на стороне сервера в файл /etc/ssh/sshd_config строчки:
>ForwardX11 yes
>X11DisplayOffset 10
>X11UseLocalhost no
>reboot или перезапуск ssh
>подключаемся
>ssh -X sergey@192.168.31.12
>запускаем любую графическую утилиту. Например firefox

# Task_2
- Создать директорию В данную директорию скопировать директории и файлы /var/log, создавая новые атрибуты (на 3 года назад)
Создать tar архив c данной директорией и применить сжатие

> sudo cp -a /var/log/* ~/T-2/ && sudo find ~/T-2/ -exec touch -mat 201811281700.00 {} \; && sudo tar -zcf arh-T-2.tar.gz ~/T-2

# Task_3
- Вывести номер строки, где указан наш пользователь в etc/passwd

> grep -n $USER /etc/passwd | cut -d ':' -f1

# Task_4
- Вывести домашнюю директорию для нашего пользователя, оперируя файлом etc/passwd

> grep $USER /etc/passwd | cut -d '/' -f2-3 | cut -d ':' -f1

# Task_5
- Посчитать кол-во строк в файле /etc/passwd

> wc -l /etc/passwd | cut -d ' ' -f1

# Task_6
- Сохранить список всех файлов в usr/bin/, которые написаны на Bash,Shell, Python и имеют кодировку UTF в файл bin.txt и отсортируйте по размеру - Выполнение 1 строка

> sudo ls -arS  /usr/bin/* | xargs  file | grep "UTF" | grep -iE 'bash|shell|python' | cut -d ':' -f1 >bin.txt

# Task_7
- 1) В домашнем каталоге пользователя создайте несколько файлов с расширением html.
- 2) Перейдите в каталог /
- 3) Найдите созданные файлы в домашнем каталоге из каталога /, не спускаясь в домашний каталог

> touch {1..9}.html
> cd /
> sudo find . -maxdepth 3 -user $USER -name *.html

# Task_8
- Скопировать все файлы, которые имеют расширение  *.html в файлы с соответствующим началом *.new.html (например был файл file1.html, а нужно чтобы стал file1.new.html):

> ls *.html | xargs basename -s .html | xargs -I {} mv {}.html {}.new.html

# Task_9
- Вывести количество каталогов в дереве `/usr/share'

> 2 варианта:
> let N=$(ls /usr/share -laF | grep /$ | wc -l)-2 && echo $N
> let N=$(find /usr/share -maxdepth 1 -type d | wc -l)-1 && echo $N

# Task_10
- Разобраться с xargs и exec. Отличия!

> xargs отдельная команда, exec функция  в find
> exec выполняется для каждого найденного файла, xargs обрабатывает сразу список
> у xargs есть проблемы с обработкой файлов с пробелами в имени
> xargs должен работать быстрее
> exec сложнее по формату

# Task_11
- Привести примеры паравиртуализации и гибридный тип виртуализации

> Пример паравиртуализации  - Xen (Один из режимов его работы, так же поддерживает аппаратную виртуализацию)
> Пример гибридного типа виртуализации - Microsoft Hyper-V, XEN-based гипервизоры

# Task_12
- Закинуть на удаленный сервис директорию/файл архивом. Создание архива должно быть отражено в команде и архив не должен быть создан локально. 1 строка

> tar cf - . | ssh sergey@192.168.5.5 'cat > /home/sergey/test.tar.gz'

# Task_13
- У нас есть репозиторий с множеством файлов в разных каталогах с расширением sh. Нужно скачать репозиторий, найти эти файлы и поменять разрешение на исполняемый файл. Сделать двумя способами в одну строку.

>Вар.1
> scp -r sergey@192.168.5.5:/home/sergey/rep-test/* /home/sergey/test/ && find /home/sergey/test -name "*.sh" -exec chmod +x {} \;
>Вар.2
> scp -r sergey@192.168.5.5:/home/sergey/rep-test/* /home/sergey/test/ && find /home/sergey/test -name "*.sh" | xargs chmod +x

