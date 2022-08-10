# HomeWork 6
1) Ваша задача - создать проект с кодом, добавить туда файлы со след. расширениями:
 * all files with exe extension
 * all files with o extension
 * all files with jar extension
 * the whole libraries directory
 Закоммитить код, исключая данные расширения файлов
Добавить эти расширения файлов в файл .gitignore

##### 
[![N|Solid](https://github.com/serwol2/DOS-07/blob/main/HW6-git/6-1.jpg)]
#####

2) Изменить регистр букв в файле 
Вы закоммитили File.txt, но осознали, что он должен быть file.txt
Изменить это.

#####
Два варианта:
●      используя новый коммит
git mv File.txt file.txt
git commit
[![N|Solid](https://github.com/serwol2/DOS-07/blob/main/HW6-git/6-2.jpg)]

●      в старом коммите должен быть файл file.
mv File.txt file.txt
git add file.txt
git commit --amend
#####

3*) Найти коммит, который был утерян
Вы создали коммит с важным куском работы. Затем решили пофиксать что-то в последнем коммите и сделали amend.
Далее вы осознали, что закоммитили не те изменения и нужно вернуться к первой версии коммита, который вы заамендили.
Однако в истории нет предыдущей версии - вы отредактировали коммит, используя git commit --amend
Ваша цель - найти первую версию фикса в репозитории.

#####
git reflog
нахожу в списке нужный(потеряный) commit
git reset --soft HEAD@{1} где HEAD@{1}- найденый в reflog потеряный commit
#####

4) Закоммитить часть работы
Вы работаете на фиксом долгое время и сделали огромную работу. Вы хотите, чтобы ваша работа была закомичена двумя коммитами.
Но к сожалению, у вас все изменения в одном файле и вы не можете разбить на два файла (разделить).

#####
git add -e имяфайла
убрать там строчки с + которые мы не хотим отдавать в 1й коммит
git commit
повторить то же самое или просто git add имяфайла и git commit
#####