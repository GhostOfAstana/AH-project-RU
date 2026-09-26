# Шпаргалка по SQL

## Основные термины
- SELECT = что показывать
- FROM = из какой таблицы
- WHERE = фильтровать строки
- ORDER BY = результат сортировки

## Основные примеры

### Показать все столбцы
SELECT * FROM users;

### Показать один столбец
SELECT name FROM users;

### Показать два столбца
SELECT name, email FROM users;

### Фильтровать строки
SELECT * FROM users WHERE city = 'Astana';

### Сортировка строк
SELECT * FROM users ORDER BY name;

### Фильтровать и сортировать
SELECT name, email FROM users WHERE city = 'Astana' ORDER BY name;

## Памятка
SQL – это:
1. выбор данных
2. выбор источника
3. фильтрация строк
4. результат сортировки
