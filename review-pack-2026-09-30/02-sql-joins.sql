-- Повторение: JOIN и GROUP BY. Основа: ../sql_day_3.sql.
-- Задание: посчитать заказы каждого пользователя, включая тех, у кого их нет.
-- У двух пользователей имя Aida: не объединяйте разные учётные записи.
WITH users(id, name) AS (
    VALUES (1, 'Aida'), (2, 'Arman'), (3, 'Aida')
), orders(id, user_id, amount) AS (
    VALUES (101, 1, 20), (102, 1, 30), (103, 3, 10)
)
SELECT u.id, u.name, COUNT(o.id) AS order_count
FROM users AS u
LEFT JOIN orders AS o ON o.user_id = u.id
GROUP BY u.id, u.name
ORDER BY u.id;
-- Результат: (1, Aida, 2), (2, Arman, 0), (3, Aida, 1).
-- LEFT JOIN сохраняет пользователя без заказов; COUNT(o.id) не считает NULL.
-- COUNT(*) посчитал бы сохранённую строку без заказа как 1.
-- Группировка только по имени объединила бы разные учётные записи Aida.

-- Задание: показать только пользователей с более чем одним заказом.
WITH users(id, name) AS (
    VALUES (1, 'Aida'), (2, 'Arman'), (3, 'Aida')
), orders(id, user_id, amount) AS (
    VALUES (101, 1, 20), (102, 1, 30), (103, 3, 10)
)
SELECT u.id, u.name, COUNT(o.id) AS order_count
FROM users AS u
LEFT JOIN orders AS o ON o.user_id = u.id
GROUP BY u.id, u.name
HAVING COUNT(o.id) > 1
ORDER BY u.id;
-- Результат: (1, Aida, 2). HAVING отбирает группы после агрегирования.
-- Документация:
-- https://www.postgresql.org/docs/current/queries-table-expressions.html
-- https://www.postgresql.org/docs/current/functions-aggregate.html
