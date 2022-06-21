##### 1) Создать launch template с веб-сервером, добавив стартовую страницу

##### 2) Создать балансировщик нагрузки

##### 3) Создать автоскейлинг группу(c 2 инстансами) и подключить ее к балансировщику

##### 4) Все это реализовать через терраформ и не забываем об outputs(arguments reference), на которые мы может ссылаться между ресурсами 

##### 5) переменные храним в dev.tfvars, prod.tfvars

Сделано ссе сразу:
 - main36.tf терраформ-файл
 - vars.tf - переменные
 - dev.auto.tfvars - значения переменных
 - nginx_and_page.sh - скрипт для userdata (устанавливается nginx и изменённая index.html)

Результат работы:

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW36-terraform-auto-scaling/HW36/screenshot-hw36-1.png)
