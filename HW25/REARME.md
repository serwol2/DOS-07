##### 1. Установить wget, htop и nginx (и запускать) на оба сервера с помощью ansible-playbook

- написаны /p1/ansible.cfg , myhosts , playbook-25-1.yml
- ansible-playbook -i myhosts playbook-25-1.yml

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW25/HW25/p1/screenshot-hw25-1.png)

Всё работает, проверено, скриншоты на даю, прошу поверить на слово )

2. *Развернуть два инстанса(t2.micro). Первый с тегом dev, второй с тегом prod. Настроить dynamic inventory, чтобы при прогоне ансибла, в зависимости от тега ставились пакеты.
Для дева ставились nginx, mysql и копировалась папка app-dev с локальной машины.
Для прода только nginx и копировалась папка app-prod.
Т.е. при запуске ansible мы указываем на какие группы инстансов выполнять.
