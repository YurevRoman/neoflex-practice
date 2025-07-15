-- Все мероприятия, 2024 года, в названии которых есть слово «семинар», но на него название не заканчивается

SELECT * FROM Event
WHERE year(Event_start) = 2024
  AND Event_name LIKE '%семинар_%';

-- Комнаты, где не проходит мероприятий

SELECT Room.Room_ID, Room.Room_number, Room.Room_capacity
FROM Room
    LEFT JOIN Event_room ON Room.Room_ID = Event_room.Room_ID
    WHERE Event_room.Event_ID IS NULL;

-- Комната, в которой проходило 2 разных мероприятия в один день в мае 2024 года

SELECT DISTINCT r.Room_number
FROM Event_room er1
     JOIN Event e1 ON er1.Event_ID = e1.Event_ID
     JOIN Event_room er2 ON er1.Room_ID = er2.Room_ID
     JOIN Event e2 ON er2.Event_ID = e2.Event_ID
     JOIN Room r ON er1.Room_ID = r.Room_ID
WHERE
    DATE(e1.Event_start) = DATE(e2.Event_start)
    AND MONTH(e1.Event_start) = 5
    AND YEAR(e1.Event_start) = 2024
    AND er1.Event_ID <> er2.Event_ID;
