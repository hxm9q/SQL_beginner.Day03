INSERT INTO
    person_order (
        id,
        person_id,
        menu_id,
        order_date
    )
SELECT generate_series(
        max(po.id) + 1, max(po.id) + (
            SELECT count(*)
            FROM person p
        )
    ), generate_series(
        (
            SELECT min(p.id)
            FROM person p
        ), (
            SELECT max(p.id)
            FROM person p
        )
    ), (
        SELECT m.id
        FROM menu m
        WHERE
            m.pizza_name = 'greek pizza'
    ), timestamp '2022-02-25'
FROM person_order po;