# Задание 1. Backend. Онлайн калькулятор на микросервисной архитектуре

## Эндпоинты в Swagger UI

![screenshot 1.jpg](img/screenshot%201.jpg)

### Эндпоинт "plus"

![screenshot 2.jpg](img/screenshot%202.jpg)

### Эндпоинт "minus"

![screenshot 3.jpg](img/screenshot%203.jpg)

### Эндпоинт "operations"

![screenshot 4.jpg](img/screenshot%204.jpg)

# Задание 2. Big Data

## Описание БД

Для этого задания использована база данных календаря корпоративных мероприятий, хранящего информацию о мероприятиях, помещениях, сотрудниках, отделах, обязательности мероприятий для посещения определенными сотрудниками.

### Установка HDFS

HDFS установлена на экземпляре Cloudera CDH на виртуальной машине

![Cloudera screenshot.png](Task%202%20%28Database%29/Screenshots/Cloudera%20screenshot.png)

Список файлов и папок в корневой директории:

![HDFS directories.png](Task%202%20%28Database%29/Screenshots/HDFS%20directories.png)

Список запущенных Java-процессов:

![Java processes.png](Task%202%20%28Database%29/Screenshots/Java%20processes.png)

Версия Hive:

![Hive version.png](Task%202%20%28Database%29/Screenshots/Hive%20version.png)

Созданные базы данных:

![All DataBases.png](Task%202%20%28Database%29/Screenshots/All%20DataBases.png)

### Структура БД

![Scheme.png](Task%202%20%28Database%29/Event%20calendar/Scheme.png)

#### Описание таблиц

**Комнаты**

| Поле          | Тип данных  | Описание                         |
|---------------|-------------|----------------------------------|
| Room_id       | INT         | Автоинкрементный идентификатор   |
| Room_number   | VARCHAR(10) | Номер помещения (например 14-23) |
| Room_capacity | INT         | Вместимость помещения            |

**Мероприятия**

| Поле        | Тип данных   | Описание                           |
|-------------|--------------|------------------------------------|
| Event_id    | INT          | Автоинкрементный идентификатор     |
| Event_name  | VARCHAR(255) | Название мероприятия               |
| Event_start | TIMESTAMP    | Дата и время начала мероприятия    |
| Event_end   | TIMESTAMP    | Дата и время окончания мероприятия |

**Отделы**

| Поле            | Тип данных   | Описание                       |
|-----------------|--------------|--------------------------------|
| Department_id   | INT          | Автоинкрементный идентификатор |
| Department_name | VARCHAR(255) | Название отдела                |

**Сотрудники**

| Поле              | Тип данных  | Описание                       |  
|-------------------|-------------|--------------------------------|  
| Employee_ID       | INT         | Автоинкрементный идентификатор |  
| Employee_surname  | VARCHAR(50) | Фамилия сотрудника             |  
| Employee_name     | VARCHAR(50) | Имя сотрудника                 |  
| Employee_patronym | VARCHAR(50) | Отчество сотрудника            |  

**Статусы посещения**

| Поле                    | Тип данных   | Описание                                                  |  
|-------------------------|--------------|-----------------------------------------------------------|  
| Attendance_status_ID    | INT          | Автоинкрементный идентификатор                            |  
| Attendance_status_name  | VARCHAR(20)  | Название статуса (Обязательное/Рекомендуемое/Нейтральное) |  

**Посещение**

| Поле                 | Тип данных | Описание                                                          |
|----------------------|------------|-------------------------------------------------------------------|
| Attendance_id        | INT        | Автоинкрементный идентификатор записи посещения                   |
| Event_id             | INT        | Внешний ключ на таблицу Event (мероприятие)                       |
| Attendance_status_id | INT        | Внешний ключ на таблицу Attendance_status (статус обязательности) |
| Employee_id          | INT        | Внешний ключ на таблицу Employee (сотрудник)                      |
| Visited              | BOOLEAN    | Факт посещения мероприятия (true/false)                           |

**Связь мероприятие-комната**

| Поле     | Тип данных | Описание                      |  
|----------|------------|-------------------------------|  
| Event_ID | INT        | Внешний ключ на таблицу Event |  
| Room_ID  | INT        | Внешний ключ на таблицу Room  |  

**Связь сотрудник-отдел**

| Поле          | Тип данных  | Описание                           |  
|---------------|-------------|------------------------------------|  
| Employee_ID   | INT         | Внешний ключ на таблицу Employee   |  
| Department_ID | INT         | Внешний ключ на таблицу Department |  
| Position      | VARCHAR(50) | Должность сотрудника в отделе      |

#### Скрипты

- [Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar/Create%20database%20and%20tables.sql)
- [Скрипт заполнения БД данными](Task%202%20%28Database%29/Event%20calendar/Insert%20data.sql)
- [Скрипт выборки данных](Task%202%20%28Database%29/Event%20calendar/Select%20scripts.sql)

#### Результаты выполнения скриптов выборки данных

- Все мероприятия, 2024 года, в названии которых есть слово «семинар», но на него название не заканчивается

![Select 1.png](Task%202%20%28Database%29/Event%20calendar/Select%20scripts%20screenshots/Select%201.png)

- Комнаты, где не проходит мероприятий

![Select 2.png](Task%202%20%28Database%29/Event%20calendar/Select%20scripts%20screenshots/Select%202.png)

- Комната, в которой проходило 2 разных мероприятия в один день в мае 2024 года

![Select 3.png](Task%202%20%28Database%29/Event%20calendar/Select%20scripts%20screenshots/Select%203.png)


### Структура БД по схеме "Звезда"

![Scheme.png](Task%202%20%28Database%29/Event%20calendar%20%28star%20scheme%29/Scheme.png)

#### Описание таблиц

**Факт Посещения**

| Поле                 | Тип данных | Описание                                  |
|----------------------|------------|-------------------------------------------|
| Attendance_id        | INT        | Идентификатор записи посещения            |
| Event_id             | INT        | Внешний ключ на таблицу Мероприятия       |
| Attendance_status_id | INT        | Внешний ключ на таблицу Статусы посещения |
| Employee_id          | INT        | Внешний ключ на таблицу Сотрудники        |
| Visited              | BOOLEAN    | Факт посещения мероприятия (true/false)   |

**Мероприятия**

| Поле        | Тип данных | Описание                           |
|-------------|------------|------------------------------------|
| Event_id    | INT        | Идентификатор мероприятия          |
| Event_name  | STRING     | Название мероприятия               |
| Event_start | TIMESTAMP  | Дата и время начала мероприятия    |
| Event_end   | TIMESTAMP  | Дата и время окончания мероприятия |

**Статусы посещения**

| Поле                    | Тип данных | Описание                                                  |  
|-------------------------|------------|-----------------------------------------------------------|  
| Attendance_status_ID    | INT        | Идентификатор статуса посещения                           |  
| Attendance_status_name  | STRING     | Название статуса (Обязательное/Рекомендуемое/Нейтральное) |  

**Сотрудники**

| Поле              | Тип данных | Описание                 |  
|-------------------|------------|--------------------------|  
| Employee_ID       | INT        | Идентификатор сотрудника |  
| Employee_surname  | STRING     | Фамилия сотрудника       |  
| Employee_name     | STRING     | Имя сотрудника           |  
| Employee_patronym | STRING     | Отчество сотрудника      |
| Department_name   | STRING     | Название отдела          |
| Position          | STRING     | Должность                |

#### Скрипты

- [Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar%20%28star%20scheme%29/Create%20database%20and%20tables.sql)
- [Скрипт заполнения БД данными](Task%202%20%28Database%29/Event%20calendar%20%28star%20scheme%29/Insert%20data.sql)

### Структура БД по схеме "Снежинка"

![Scheme.png](Task%202%20%28Database%29/Event%20calendar%20%28snowflake%20scheme%29/Scheme.png)

#### Описание таблиц

- **Мероприятия**

| Поле        | Тип данных | Описание                           |
|-------------|------------|------------------------------------|
| Event_id    | INT        | Идентификатор мероприятия          |
| Event_name  | STRING     | Название мероприятия               |
| Event_start | TIMESTAMP  | Дата и время начала мероприятия    |
| Event_end   | TIMESTAMP  | Дата и время окончания мероприятия |

- **Комнаты**

| Поле        | Тип данных | Описание                           |
|-------------|------------|------------------------------------|
| Room_id     | INT        | Идентификатор комнаты              |
| Room_number | STRING     | Номер комнаты                      |
| Capacity    | INT        | Вместимость комнаты                |

- **Отделы**

| Поле            | Тип данных | Описание              |
|-----------------|------------|-----------------------|
| Department_id   | INT        | Идентификатор отдела  |
| Department_name | STRING     | Название отдела       |

- **Сотрудники**

| Поле               | Тип данных | Описание                 |
|--------------------|------------|--------------------------|
| Employee_ID        | INT        | Идентификатор сотрудника |
| Employee_surname   | STRING     | Фамилия сотрудника       |
| Employee_name      | STRING     | Имя сотрудника           |
| Employee_patronym  | STRING     | Отчество сотрудника      |

- **Сотрудники и отделы**

| Поле          | Тип данных | Описание                           |
|---------------|------------|------------------------------------|
| Employee_id   | INT        | Внешний ключ на таблицу Сотрудники |
| Department_ID | INT        | Внешний ключ на таблицу Отделы     |
| Position      | STRING     | Должность сотрудника в отделе      |

- **Статусы посещения**

| Поле                    | Тип данных | Описание                                                  |
|-------------------------|------------|-----------------------------------------------------------|
| Attendance_status_ID    | INT        | Идентификатор статуса посещения                           |
| Attendance_status_name  | STRING     | Название статуса (Обязательное/Рекомендуемое/Нейтральное) |

- **Посещения**

| Поле                 | Тип данных | Описание                                  |
|----------------------|------------|-------------------------------------------|
| Event_id             | INT        | Внешний ключ на таблицу Мероприятия       |
| Room_id              | INT        | Внешний ключ на таблицу Комнаты           |                                    |
| Attendance_status_id | INT        | Внешний ключ на таблицу Статусы посещения |
| Employee_id          | INT        | Внешний ключ на таблицу Сотрудники        |
| Visited              | BOOLEAN    | Факт посещения мероприятия (true/false)   |

#### Скрипты

- [Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar%20%28snowflake%20scheme%29/Create%20database%20and%20tables.sql)
- [Скрипт заполнения БД данными](Task%202%20%28Database%29/Event%20calendar%20%28snowflake%20scheme%29/Insert%20data.sql)

### Структура БД по схеме "Data Vault"

![Scheme.png](Task%202%20%28Database%29/Event%20calendar%20%28Data%20vault%29/Scheme.png)

#### Описание таблиц

**Хабы (Hubs)**

*Хабы содержат уникальные бизнес-ключи для каждого объекта.*

- **Hub_Employee**

  | Поле             | Тип данных | Описание               |
  |------------------|------------|------------------------|
  | Hash_Employee_ID | INT        | Хэш бизнес-ключа хаба  |
  | Employee_ID      | INT        | Бизнес-ключ сотрудника |
  | Load_DTS         | TIMESTAMP  | Дата загрузки записи   |
  | Record_Source    | STRING     | Источник данных        |

- **Hub_Event**

  | Поле          | Тип данных | Описание                |
  |---------------|------------|-------------------------|
  | Hash_Event_ID | INT        | Хэш бизнес-ключа хаба   |
  | Event_ID      | INT        | Бизнес-ключ мероприятия |
  | Load_DTS      | TIMESTAMP  | Дата загрузки записи    |
  | Record_Source | STRING     | Источник данных         |

- **Hub_Room**

  | Поле          | Тип данных | Описание              |
  |---------------|------------|-----------------------|
  | Hash-Room_ID  | INT        | Хэш бизнес-ключа хаба |
  | Room_ID       | INT        | Бизнес-ключ комнаты   |
  | Load_DTS      | TIMESTAMP  | Дата загрузки записи  |
  | Record_Source | STRING     | Источник данных       |

- **Hub_Department**

  | Поле               | Тип данных | Описание               |
  |--------------------|------------|------------------------|
  | Hash_Department_ID | INT        | Хэш бизнес-ключа хаба  |
  | Department_ID      | INT        | Бизнес-ключ отдела     |
  | Load_DTS           | TIMESTAMP  | Дата загрузки записи   |
  | Record_Source      | STRING     | Источник данных        |

- **Hub_Attendance_Status**

  | Поле                      | Тип данных | Описание                       |
  |---------------------------|------------|--------------------------------|
  | Hash_Attendance_Status_ID | INT        | Хэш бизнес-ключа хаба          |
  | Attendance_Status_ID      | INT        | Бизнес-ключ статуса посещения  |
  | Load_DTS                  | TIMESTAMP  | Дата загрузки записи           |
  | Record_Source             | STRING     | Источник данных                |

- **Hub_Attendance**

  | Поле               | Тип данных | Описание              |
  |--------------------|------------|-----------------------|
  | Hash_Attendance_ID | INT        | Хэш бизнес-ключа хаба |
  | Attendance_ID      | INT        | Бизнес-ключ посещения |
  | Load_DTS           | TIMESTAMP  | Дата загрузки записи  |
  | Record_Source      | STRING     | Источник данных       |
 

**Линки (Links)**

*Линки представляют связи между хабами.*

- **Link_Attendance**

  | Поле                      | Тип данных | Описание                        |
  |---------------------------|------------|---------------------------------|
  | Hash_Link_ID              | INT        | Суррогатный ключ линка          |
  | Hash_Event_ID             | INT        | Ссылка на Hub_Event             |
  | Hash_Attendance_ID        | INT        | Ссылка на Hub_Attendance        |
  | Hash_Attendance_Status_ID | INT        | Ссылка на Hub_Attendance_Status |
  | Hash_Employee_ID          | INT        | Ссылка на Hub_Employee          |
  | Load_DTS                  | TIMESTAMP  | Дата загрузки записи            |
  | Record_Source             | STRING     | Источник данных                 |

- **Link_Event_Room**

  | Поле          | Тип данных | Описание               |
  |---------------|------------|------------------------|
  | Hash_Link_ID  | INT        | Суррогатный ключ линка |
  | Hash_Room_ID  | INT        | Ссылка на Hub_Room     |
  | Hash_Event_ID | INT        | Ссылка на Hub_Event    |
  | Load_DTS      | TIMESTAMP  | Дата загрузки записи   |
  | Record_Source | STRING     | Источник данных        |

- **Link_Employee_Department**

  | Поле               | Тип данных | Описание                 |
  |--------------------|------------|--------------------------|
  | Hash_Link_ID       | INT        | Суррогатный ключ линка   |
  | Hash_Employee_ID   | INT        | Ссылка на Hub_Employee   |
  | Hash_Department_ID | INT        | Ссылка на Hub_Department |
  | Load_DTS           | TIMESTAMP  | Дата загрузки записи     |
  | Record_Source      | STRING     | Источник данных          |

**Сателлиты (Satellites)**

*Сателлиты содержат атрибуты и историю изменений для хабов и линков.*

- **Sat_Employee**

  | Поле              | Тип данных | Описание                       |
  |-------------------|------------|--------------------------------|
  | Hash_Employee_ID  | INT        | Ссылка на Hub_Employee         |
  | Load_DTS          | TIMESTAMP  | Дата загрузки записи           |
  | Record_Source     | STRING     | Источник данных                |
  | Employee_surname  | STRING     | Фамилия сотрудника             |
  | Employee_name     | STRING     | Имя сотрудника                 |
  | Employee_patronym | STRING     | Отчество сотрудника            |

- **Sat_Event**

  | Поле          | Тип данных | Описание                           |
  |---------------|------------|------------------------------------|
  | Hash_Event_ID | INT        | Ссылка на Hub_Event                |
  | Load_DTS      | TIMESTAMP  | Дата загрузки записи               |
  | Record_Source | STRING     | Источник данных                    |
  | Event_name    | STRING     | Название мероприятия               |
  | Event_start   | TIMESTAMP  | Дата и время начала мероприятия    |
  | Event_end     | TIMESTAMP  | Дата и время окончания мероприятия |

- **Sat_Room**

  | Поле          | Тип данных | Описание                         |
  |---------------|------------|----------------------------------|
  | Hash_Room_ID  | INT        | Ссылка на Hub_Room               |
  | Load_DTS      | TIMESTAMP  | Дата загрузки записи             |
  | Record_Source | STRING     | Источник данных                  |
  | Room_number   | STRING     | Номер помещения                  |
  | Room_capacity | INT        | Вместимость помещения            |

- **Sat_Department**

  | Поле               | Тип данных | Описание                       |
  |--------------------|------------|--------------------------------|
  | Hash_Department_ID | INT        | Ссылка на Hub_Department       |
  | Load_DTS           | TIMESTAMP  | Дата загрузки записи           |
  | Record_Source      | STRING     | Источник данных                |
  | Department_name    | STRING     | Название отдела                |


- **Sat_Attendance_Status**

  | Поле                      | Тип данных | Описание                                                  |
  |---------------------------|------------|-----------------------------------------------------------|
  | Hash_Attendance_Status_ID | INT        | Ссылка на Hub_Attendance_Status                           |
  | Load_DTS                  | TIMESTAMP  | Дата загрузки записи                                      |
  | Record_Source             | STRING     | Источник данных                                           |
  | Attendance_status_name    | STRING     | Название статуса (Обязательное/Рекомендуемое/Нейтральное) |


- **Sat_Attendance**

  | Поле               | Тип данных | Описание                       |
  |--------------------|------------|--------------------------------|
  | Hash_Attendance_ID | INT        | Ссылка на Hub_Attendance       |
  | Load_DTS           | TIMESTAMP  | Дата загрузки записи           |
  | Record_Source      | STRING     | Источник данных                |
  | Visited            | BOOLEAN    | Факт посещения                 |


- **Sat_Employee_Department**

  | Поле          | Тип данных | Описание                           |
  |---------------|------------|------------------------------------|
  | Hash_Link_ID  | INT        | Ссылка на Link_Employee_Department |
  | Load_DTS      | TIMESTAMP  | Дата загрузки записи               |
  | Record_Source | STRING     | Источник данных                    |
  | Position      | STRING     | Должность сотрудника               |

#### Скрипты

- [Скрипт создания БД и таблиц](Task%202%20%28Database%29/Event%20calendar%20%28Data%20vault%29/Create%20database%20and%20tables.sql)
