SELECT m.pizza_name, m.price, pz.name AS pizzeria_name
FROM
    menu m
    LEFT JOIN person_order po ON m.id = po.menu_id
    LEFT JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE
    po.id IS NULL
ORDER BY m.pizza_name, m.price;