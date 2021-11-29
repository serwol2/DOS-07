# HomeWork-14

# Part1
Срок до 29.11.2021

- 1) Записать в файл информацию о типе ОС

> lsb_release -is >1.txt

- 2) Записать в файл Имя ОС

> lsb_release -cs >2.txt

- 3) Записать версию ядра

> uname -r >3.txt

- 4) Записать ip адрес

> hostname -I >4.txt

- 5) Записать имя сервера 

> hostname -s >5.txt

- 6) Сохранить информацию о процессоре в файле (какой процессор, сколько ядер)

> lscpu | grep "Model name"| cut -c34-100 >6.txt && grep 'model name' /proc/cpuinfo | wc -l >>6.txt
> Можно все сделать через lscpu или чтением /proc/cpuinfo. Сделал так - для разнообразия.
 
- 7) Записать LA (Load Average) за последние 15 минут в файл.

> uptime |awk '{print $10;}' >7.txt

- 8) Записать время работы системы в файл.

> uptime -p >8.txt 

- 9) Вывести информацию об использованной RAM и записать в файл.

> free | grep "Mem" | awk '{print $3;}' >9.txt

- 10) Сохранить информацию о потребляемом Swap в файл

> free | grep "Swap" | awk '{print $3;}' >A.txt

- 11) Записать текущие размеры дисков в файл.

> df -P | sed -n '2,$p'|awk '{print $1;}{print $2;}' >B.txt

- 12) Записать в файл информацию об авторизованных пользователях в системе в данный момент.

> who >C.txt

- 13*) Объединить все файлы в один

> cat *.txt >all.all
>  или 
> find . -maxdepth 1  -name "*.txt" | sort | xargs cat >>all.all

>результат:

>Ubuntu
>focal
>5.11.0-38-generic
>192.168.5.5 
>sergey-VB
>AMD Ryzen 3 4300U with Radeon Graphics
>2
>0,07
>up 1 hour, 5 minutes
>1110976
>0
>udev
>1984420
>tmpfs
>402812
>/dev/sda5
>9736500
>tmpfs
>2014044
>tmpfs
>5120
>tmpfs
>2014044
>/dev/loop0
>128
>/dev/loop2
>9344
>/dev/loop4
>56832
>/dev/loop6
>224256
>/dev/loop3
>101888
>/dev/loop5
>63360
>/dev/loop1
>9344
>/dev/loop7
>56832
>/dev/loop8
>101888
>/dev/loop9
>66688
>/dev/loop10
>55552
>/dev/loop11
>52224
>/dev/loop12
>43264
>/dev/loop13
>253952
>/dev/loop14
>224256
>/dev/loop15
>33280
>/dev/loop16
>66816
>/dev/sda1
>523248
>tmpfs
>402808
>sergey   :0           2021-11-28 12:45 (:0)
>sergey   pts/1        2021-11-28 13:43 (192.168.5.60)


# Part2

Срок до 29.11.2021

- 1) Получить список всех UNIX Socket портов на машине, которые прослушиваются и вывести в файл только названия сокетов

> sudo netstat -ltup |grep LISTEN| cut -d '/' -f2|awk '{print $1}' >listen_soc

- 2) Получить список всех udp портов на машине и записать в файл (2 способа)

> sudo netstat -anu4 >udp.txt
> sudo lsof -i -P | grep UDP > udp.txt
 

- 3) Вывести в файл таблицу маршрутизации на машине


> routel >routtab.txt
> ip route >routetab.txt
> route >routetab.txt


- 4) Получить список всех открытых портов на машине (записать в файл, 2 способа)

> sudo lsof -i -P >ports.txt
> sudo ss -tulpn

- 5) Вывести статистику для каждого протокола на машине

> sudo ss -s
> sudo netstat -s

- 6) Установить переменную окружения, так чтобы при логине и удаленном соединении эта 
переменная оставалась в системе для текущего пользователя

> Редактирую файл .bashrc текущего пользователя, добавляю туда строчку
> export SERW="My variable"
> можно обновить конфигурацию командой source .bashrc
> можно увидеть значение переменной: echo $SERW
> не важно как зашел данный пользователь

- 7*) Вывести в файл список всех unix socket, у которых статус Connected в виде I-Node - Path списком и записать в файл
> sudo netstat -x | grep CONNECTED | awk '{print $7,"-",$8}' >id_path.txt

