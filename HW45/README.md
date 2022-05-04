1. Создать свою диаграмму по CI/CD

Для примера взал приложение отсюда:
https://alextoolsblog.blogspot.com/2020/04/docker-container-dockerfile.html
https://alextoolsblog.blogspot.com/2020/04/build-and-run-app-in-container.html

https://cloud.croc.ru/blog/about-technologies/flask-prilozheniya-v-docker/

https://github.com/marketplace/actions/send-email


2. Реализовать CI/CD на github actions следуя воркфлоу диаграммы, как обсуждали на уроке
3. Написать джобу, которая вызывается при коммите в репу и забирает оттуда файлы и закидывает их на S3 бакет(должно быть поле Exclude)

https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html


4. Поднять базу данных и при коммите в репу(в репе должен передаваться SELECT запрос) дергается Jenkins джоба, которая забирает этот запрос, делает бэкап базы и закидывает на S3 и выполняет этот запрос и закидывает результат на S3(можно использовать базу, которую проходили в курсе)
