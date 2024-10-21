WITH
    PizzasAndPrices AS (
        SELECT m.pizza_name, m.price, p.name, p.id
        FROM menu m
            JOIN pizzeria p ON m.pizzeria_id = p.id
    ),
    Q1Copy AS (
        SELECT *
        FROM PizzasAndPrices
    )
SELECT
    q1.pizza_name,
    q1.name AS pizzeria_name_1,
    q2.name AS pizzeria_name_2,
    q1.price
FROM
    PizzasAndPrices q1
    JOIN Q1Copy q2 ON q1.pizza_name = q2.pizza_name
    AND q1.price = q2.price
    AND q1.id <> q2.id
ORDER BY q1.pizza_name