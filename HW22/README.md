##### 1. Можно ли указать в докерфайле на базе ubuntu entrypoint sleep 20 ?

Можно.
Например, вот так:
FROM ubuntu
ENTRYPOINT echo "start" && sleep 20 && echo "stop" 

2. Создать два контейнера, с приложением и базой в разных подсетях, организовать взаимодействие
(через docker-compose и без).

https://doka.guide/tools/docker-compose/


 
3. Написать Dockerfile с приложением и разместить его в изолированной сети. И можно ли в Dockerfile создать сеть?

4. Развернуть через docker-compose example voting app, что разбирали на лекции. Сделать тоже самое без docker-compose.

5. * Посмотреть, что такое multistaged docker containers. Показать реализацию.
6. *Git Fork and Git upstream
