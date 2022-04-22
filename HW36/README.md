##### 1) Создать launch template с веб-сервером, добавив стартовую страницу

2) Создать балансировщик нагрузки

https://aws.plainenglish.io/deploy-a-set-of-ec2-instances-behind-an-alb-using-terraform-403fe584f09e
https://medium.com/cognitoiq/terraform-and-aws-application-load-balancers-62a6f8592bcf

3) Создать автоскейлинг группу(c 2 инстансами) и подключить ее к балансировщику
4) Все это реализовать через терраформ и не забываем об outputs(arguments reference), на которые мы может ссылаться между ресурсами 
5) переменные храним в dev.tfvars, prod.tfvars
