# Задание 1. Backend. Онлайн калькулятор на микросервисной архитектуре

## Эндпоинты в Swagger UI

![screenshot 1.jpg](img/screenshot%201.jpg)

## Эндпоинт "plus"

![screenshot 2.jpg](img/screenshot%202.jpg)

## Эндпоинт "minus"

![screenshot 3.jpg](img/screenshot%203.jpg)

# Задание 2. Big Data

## Описание БД

Для этого задания использована база данных календаря корпоративных мероприятий, хранящего информацию о мероприятиях, помещениях, сотрудниках, отделах, обязательности мероприятий для посещения определенными сотрудниками.

## Установка HDFS

HDFS установлена на экземпляре Cloudera CDH на виртуальной машине

![Cloudera screenshot.png](Task%202%20%28Database%29/Screenshots/Cloudera%20screenshot.png)

Список файлов и папок в корневой директории:

![HDFS directories.png](Task%202%20%28Database%29/Screenshots/HDFS%20directories.png)

Список запущенных Java-процессов:

![Java processes.png](Task%202%20%28Database%29/Screenshots/Java%20processes.png)

Версия Hive:

![Hive version.png](Task%202%20%28Database%29/Screenshots/Hive%20version.png)

Структура БД:
![Scheme.png](Task%202%20%28Database%29/Event%20calendar/Scheme.png)

Описание таблиц

Комнаты

| Поле          | Тип данных  | Описание                         |
|---------------|-------------|----------------------------------|
| Room_id       | INT         | Автоинкрементный идентификатор   |
| Room_number   | VARCHAR(10) | Номер помещения (например 14-23) |
| Room_capacity | INT         | Вместимость помещения            |

Мероприятия

| Поле        | Тип данных   | Описание                           |
|-------------|--------------| ---------------------------------- |
| Event_id    | INT          | Автоинкрементный идентификатор     |
| Event_name  | VARCHAR(255) | Название мероприятия               |
| Event_start | TIMESTAMP    | Дата и время начала мероприятия    |
| Event_end   | TIMESTAMP    | Дата и время окончания мероприятия |

Отделы

| Поле           | Тип данных   | Описание                       |
|----------------|--------------|--------------------------------|
| Department_id  | INT          | Автоинкрементный идентификатор |
| Department_name| VARCHAR(255) | Название отдела                |

Посещение

| Поле                 | Тип данных | Описание                       |
|----------------------|------------|--------------------------------|
| Attendance_id        | INT        |                                |
| Event_id             | INT        |                                |
| Attendance_status_id | INT        |                                |
| Employee_id          | INT        |                                |
| Visited              | BOOLEAN    |                                |


[Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar/Create%20database%20and%20tables.sql)

[Скрипт заполнения БД данными](Task%202%20%28Database%29/Event%20calendar/Insert%20data.sql)

Структура БД по схеме "Звезда":
![Scheme.png](Task%202%20%28Database%29/Event%20calendar%20%28star%20scheme%29/Scheme.png)
[Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar%20%28star%20scheme%29/Create%20database%20and%20tables.sql)

[Скрипт заполнения БД данными](Task%202%20%28Database%29/Event%20calendar%20%28star%20scheme%29/Insert%20data.sql)

Структура БД по схеме "Data vault"
![Scheme.png](Task%202%20%28Database%29/Event%20calendar%20%28Data%20vault%29/Scheme.png)
[Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar%20%28Data%20vault%29/Create%20database%20and%20tables.sql)
