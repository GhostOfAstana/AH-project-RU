# Postman: эхо не означает сохранение

Основа: [день 1](../postman_day_1/notes.md), [день 2](../postman_day_2/notes.md) и [отчёт об инциденте 1](../incident_report_1.md).

## Задание

POST к эхо-сервису вернул 200 и повторил JSON. Доказывает ли это сохранение заказа?

## Разбор

Это подтверждает получение и отражение запроса endpoint. Для проверки сохранения нужен контракт API и наблюдаемый сохранённый ресурс. Учебный эхо-сервис не является базой заказов.

## Небольшая практика

1. Задайте GET `https://postman-echo.com/get` и query-параметр `city=Astana`.
2. Проверьте наличие параметра в ответе.
3. Задайте POST `https://postman-echo.com/post`, JSON `{"city":"Astana","purpose":"practice"}` и `Content-Type: application/json`.
4. Сравните отправленный JSON с отражённым. Запишите фактический статус.
5. Отправьте запрос без тела и сравните результат. Для некоторых API пустое тело допустимо; обязательные поля определяются контрактом.

Дополнительная проверка в Postman после POST:

```javascript
pm.test("JSON was echoed", function () {
    const data = pm.response.json();
    pm.expect(data.json.city).to.eql("Astana");
});
```

Не отправляйте пароли и персональные данные в публичный эхо-сервис. После выполнения запишите настоящую дату и результат проверки.

Справка: [проверка ответов в Postman](https://learning.postman.com/docs/tests-and-scripts/write-scripts/test-scripts/).
