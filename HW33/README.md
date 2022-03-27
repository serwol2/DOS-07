##### 1. Поднять инстанс в us-east-1, поставить туда nginx и создать ami
 - запущен инстанс в N.Virginia, запущен nginx

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p1-1.png)

 - создан ami

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p1-2.png)

##### 2. Написать скрипт, который будет копировать эту ami в другой регион

   - скрипт copy-ami.sh в качестве параметров в скрипт регион откуда копировать и регион куда копировать

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p2-1.png)



##### 3. Создать vpc, сделать 3 сабнеты (паблик, изолированную и бэкенд)

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p3-1.png)


##### 4. Приаттачить internet gateway к этой vpc

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p4-1.png)


##### 5. Настроить маршрутизацию между этими сабнетами

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p5-1.png)


##### 6. Развернуть бастион в паблик сети и nginx в изолированной

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p7-1.png)

##### 7. Проверить доступ из бастиона к изолированной сети

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW33/HW33/screenshot-p7-2.png)

8. Поднять RDS с сервер с базой данных, настроить репликацию и бэкапы
9. Написать скрипт, который будет делать бэкап базы по расписанию и хранить на s3

10. Посмотреть, как асьюмить роли. Создать роль и заасьюмить ее пользователем
11. Настроить отображение вебконтента (Index.html) через cloudfront + s3
(путь /dos-07 в cloudfront, index.html не доступен из вне)
12. Настроить отображение вебконтента (Index.html) через cloudfront + ALB + EC2
