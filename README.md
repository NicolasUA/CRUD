# CRUD
Simple CRUD web-app with paging and find

За основу взял вот это:
http://shrestha-manoj.blogspot.com/2014/05/spring-mvc-maven-hibernate-crud-example.html

После загрузки приложения из GitHub:

1. Скомпилировать Maven.
2. Настроить соединение с базой test:root@root
3. Добавить в базу тестовые данные (скрипт users.sql)
4. Создать артефакт WAR, положив в него скомпилированные классы, библиотеки и WEB интерфейс.
5. Настроить Tomcat.
6. Запустить Tomcat и разместить на нем WAR.
7. Доступ по пути http://localhost:8080/users/
