##### 1. Поднять инстанс в us-east-1, поставить туда nginx и создать ami
 - запущен инстанс в N.Virginia, запущен nginx

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p1-1.png)

 - создан ami

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p1-2.png)

2. Написать скрипт, который будет копировать эту ami в другой регион

получить список AMI : aws ec2 describe-images --region us-east-1 --owners 273043149442 --output json | jq '.Images[0].ImageId'| sed -e "s/^.//;s/.$//"
                      aws ec2 describe-images --region us-east-1 --owners 273043149442 --output json | jq '.Images[].ImageId'| sed -e "s/^.//;s/.$//"

aws ec2 describe-images --region us-east-1 --owners self --output json | jq '.Images[].Name'| sed -e "s/^.//;s/.$//" | nl

   - передаю в качестве параметров в скрипт регион откуда копировать и регион куда копировать
   - команда выше выводит нумерованный список AMI 
   - ждем ввода номера ami 
   - копируем выбранный (получаем ImageId командой еще выше согласно номера массива -1) 

aws ec2 describe-images --region us-east-1 --owners 273043149442 --output json

3. Создать vpc, сделать 3 сабнеты (паблик, изолированную и бэкенд)
4. Приаттачить internet gateway к этой vpc
5. Настроить маршрутизацию между этими сабнетами
6. Развернуть бастион в паблик сети и nginx в изолированной
7. Проверить доступ из бастиона к изолированной сети
8. Поднять RDS с сервер с базой данных, настроить репликацию и бэкапы
9. Написать скрипт, который будет делать бэкап базы по расписанию и хранить на s3
10. Посмотреть, как асьюмить роли. Создать роль и заасьюмить ее пользователем
11. Настроить отображение вебконтента (Index.html) через cloudfront + s3
(путь /dos-07 в cloudfront, index.html не доступен из вне)
12. Настроить отображение вебконтента (Index.html) через cloudfront + ALB + EC2
