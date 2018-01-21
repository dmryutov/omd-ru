# Тестовое задание OMD OM Group

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Тестовое задание OMD OM Group по сбору, хранению, извлечению данных и аналитике

## Постановка задачи
Представлена в файле [instruction.docx](instruction.docx)

## Используемые технологии
- Python 3.6
- Django
- HTML5
- CSS
- JS (ES6)
- Bootstrap 4

## Запуск
Скачать репозиторий:
```
git clone https://github.com/dmryutov/omd-ru/
cd omd-ru
```
В файле db_config.py настроить подключение к БД (PostgreSQL):
```
DB_NAME = 'name'
DB_USER = 'user'
DB_PASSWORD = 'pass'
DB_HOST = 'localhost'
DB_PORT = '5432'
```
Установить зависимости:
```
pip install -r requirements.txt
```
Применить миграции к БД:
```
./manage.py makemigrations
./manage.py migrate
```
Создать суперпользователя. Ввести необходимые данные (логин, email, пароль):
```
./manage.py createsuperuser
```	
Запустить сервер:
```
./manage.py runserver
```

В файле [dump.sql](dump.sql) находится дамп уже готовой базы, который можно развернуть
Добавлены пользователи:
- Администратор - есть доступ в админ-панель, права на просмотр всех ФО РФ
	- Логин: admin
	- Пароль: adminadmin
- Менеджер (Центр) - добавлены права на просмотр только южных ФО РФ
	- Логин: center
	- Пароль: centercenter
- Менеджер (Юг) - добавлены права на просмотр только центральных ФО РФ
	- Логин: south
	- Пароль: southsouth

## Основные файлы
- [analysis.xlsx](analysis.xlsx) - Результаты анализа
- [db_config.py](db_config.py) - Настройки БД
- [dump.sql](dump.sql) - Дамп БД
- [dealer](dealer)
	- [admin.py](dealer/admin.py) - Настройка данных для админ-панели
	- [cities.py](dealer/cities.py) - Список городов
	- [models.py](dealer/models.py) - Описание моделей (таблиц БД)
	- [parser.py](dealer/parser.py) - Парсер данных
	- [serializers.py](dealer/serializers.py) - Сериализация данных
	- [urls.py](dealer/urls.py) - Роутинг
	- [views.py](dealer/views.py) - Парсер данных
- [instruction.docx](instruction.docx) - Описание результата, инструкция по запуску
- [requirements.txt](requirements.txt) - Необходимые библиотеки
- [task.docx](task.docx) - Постановка задачи
- [templates](templates) - Папка с шаблонами (верстка страницы)
- [static](static)
	- [css](static/css) - Папка со стилями
	- [js/script.js](static/js/script.js) - Скрипт загрузки данных при смене города

## Результаты анализа
Представлены в файле [analysis.xlsx](analysis.xlsx)
