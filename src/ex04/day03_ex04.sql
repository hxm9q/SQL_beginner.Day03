WITH
    Orders AS (
        SELECT p.gender, pz.name AS pizzeria_name
        FROM
            person_order po
            JOIN person p ON po.person_id = p.id
            JOIN menu m ON po.menu_id = m.id
            JOIN pizzeria pz ON m.pizzeria_id = pz.id
    ),
    MenOrders AS (
        SELECT *
        FROM Orders o
        WHERE
            o.gender = 'male'
    ),
    WomenOrders AS (
        SELECT *
        FROM Orders o
        WHERE
            o.gender = 'female'
    ),
    OnlyMenOrders AS (
        SELECT pizzeria_name
        FROM MenOrders
        EXCEPT
        SELECT pizzeria_name
        FROM WomenOrders
    ),
    OnlyWomenOrders AS (
        SELECT pizzeria_name
        FROM WomenOrders
        EXCEPT
        SELECT pizzeria_name
        FROM MenOrders
    )
SELECT *
FROM OnlyMenOrders
UNION
SELECT *
FROM OnlyWomenOrders
ORDER BY pizzeria_name;