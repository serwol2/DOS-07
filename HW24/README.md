Срок до 23.01.2022
##### 1. Повторить все команды, которые разбирали на практике (установка nginx на ubuntu и centos)

Особенности:
Для установки на Ubuntu пришлось создать файл: /etc/sudoers.d/NOPASSWD
c содержимым: sergey ALL=(ALL:ALL) NOPASSWD:ALL

Для корректной работы на Centos пришлось открывать порт http на файрволе и перезапускать файрвол (в playbook)

- Написал /p1/ansible.cfg , /p1/my_inventory /p1/playbook-1.yml

ansible-playbook -i my_inventory playbook-1.yml

(сюда скриншот)


##### 2. Установить докер и docker-compose на машины с убунту и на centos
3. Развернуть приложение voting-app, используя docker-compose через ansible
