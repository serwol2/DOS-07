Срок до 21.01.2021
1. Развернуть систему управления конфигруацией ansible в докере и управлять нашими хостами
 - Написал (/p1/Dockerfile)
 - docker build -t ubuntu-ansible .
 - Написал /home/sergey/DOS-07/HW23/hosts (в качестве inventory) 
 - docker run -it -v /home/sergey/DOS-07/HW23/p1:/ansible -v/home/sergey/.ssh:/root/.ssh  ubuntu-ansible bash
 монтирую в контейнер директорий с hosts и с ключами 

(положить сюда скриншот)

2. Развернуть 4 виртуальные машины ubuntu и создать inventory file (db и app для дев и prod). 
Выполнить пинг через ansible для группы дев и прод.
3. Повторить пункт 2 только в докере.
4. Создать docker-compose file без хранения секретов, а передавать через параметры или файл
5. Докеризировать bash сервис


