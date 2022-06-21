##### 1) Развернуть mysql и подкинуть нужную конфигурацию через ansible


- создал роль ansible inst-mysql: 
   ansible-galaxy init inst-mysql
- в это роли инсталлируется mysql, подкидывается файл конфигурации из директория files роли, создаются таблицы    
- инсталировал ansible роль для работы с базой данных: 
   ansible-galaxy collection install community.mysql

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW41/HW41/screenshot-HW41-p1-1.png)


##### 2) Посмотреть файл my.cnf, как его тюнить(поискать варианты по безопасности).

- настройка ssl: https://dev.mysql.com/doc/mysql-secure-deployment-guide/5.7/en/secure-deployment-secure-connections.html
 
##### 3) Дополнить таблицу с корзиной в базе данных shop, с которой работали на уроке

- сделано в p.1

##### 4) Посчитать суммарную корзину покупок для каждого из пользователей и отсортировать по порядку


- заполняю созданные выше таблички данными, например :

    insert into customer (name,phone,email) values ("Vasilij Pupkin","123456","pup@kin.com");

- результат заполнения :
![N|Solid](https://github.com/serwol2/DOS-07/blob/HW41/HW41/screenshot-HW41-p4-1.png)

- запрос суммарной корзины покупок (cart) для пользователей, отсортировано по имени: 

SELECT customer.name, Sum(product.price) 
FROM (cart INNER JOIN customer
ON cart.customer_id = customer.Id)
INNER JOIN product ON cart.product_id = product.id
GROUP BY customer.name ORDER BY customer.name;

Результат: 

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW41/HW41/screenshot-HW41-p4-2.png)


5) *Развернуть через ansible mysql master и слейву с репликацией(1 мастер и 2 слейва)

В ansible делаем все через роли, можно посмотреть готовую роли в интернете.
