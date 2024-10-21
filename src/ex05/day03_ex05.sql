WITH
    AndreyVisit AS (
        SELECT av.name AS pizzeria_name
        FROM (
                SELECT p.name, pv.person_id
                FROM person_visits pv
                    JOIN pizzeria p ON pv.pizzeria_id = p.id
            ) AS av
        WHERE
            av.person_id = 2
    ),
    AndreyOrder AS (
        SELECT ao.name AS pizzeria_name
        FROM (
                SELECT p.name, po.person_id
                FROM
                    person_order po
                    JOIN menu m ON po.menu_id = m.id
                    JOIN pizzeria p ON m.pizzeria_id = p.id
            ) AS ao
        WHERE
            ao.person_id = 2
    )
SELECT *
FROM AndreyVisit
EXCEPT
SELECT *
FROM AndreyOrder