SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
FROM
    menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_visits pv ON pz.id = pv.pizzeria_id
    JOIN person p ON pv.person_id = p.id
WHERE
    p.name = 'Kate'
    AND m.price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pz.name;