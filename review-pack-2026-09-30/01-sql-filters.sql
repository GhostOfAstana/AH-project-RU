-- Повторение: фильтры и NULL. Основа: ../sql_day_1.sql, ../sql_day_4.sql.
-- Задание: найти пользователей Астаны или Алматы старше 25 лет.
-- До запуска подумайте, попадёт ли в выборку неизвестный возраст (NULL).
-- SELECT использует временные значения CTE; таблицы не меняются.
WITH users(id, name, city, age) AS (
    VALUES (1, 'Aida', 'Astana', 28),
           (2, 'Arman', 'Almaty', 22),
           (3, 'Dana', 'Astana', NULL),
           (4, 'Murat', 'Karaganda', 41),
           (5, 'Aida', 'Almaty', 31)
)
SELECT id, name, city
FROM users
WHERE (city = 'Astana' OR city = 'Almaty') AND age > 25
ORDER BY id;
-- Результат: (1, Aida, Astana), (5, Aida, Almaty).
-- Скобки явно объединяют условия OR. NULL > 25 даёт неизвестное значение,
-- поэтому WHERE не выбирает эту строку.

-- Задание: найти запись, для которой нужно уточнить возраст.
WITH users(id, name, city, age) AS (
    VALUES (1, 'Aida', 'Astana', 28),
           (2, 'Arman', 'Almaty', 22),
           (3, 'Dana', 'Astana', NULL),
           (4, 'Murat', 'Karaganda', 41),
           (5, 'Aida', 'Almaty', 31)
)
SELECT id, name FROM users WHERE age IS NULL ORDER BY id;
-- Результат: (3, Dana). Используйте IS NULL, а не = NULL.
-- Дополнение: замените проверку города на city IN ('Astana', 'Almaty').
-- Объясните, почему для этих данных результат остаётся тем же.
