WITH
    Visits AS (
        SELECT pv.pizzeria_id, pz.name AS pizzeria_name, p.gender
        FROM
            person_visits pv
            JOIN person p ON pv.person_id = p.id
            JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    ),
    MenVisits AS (
        SELECT *
        FROM Visits v
        WHERE
            v.gender = 'male'
    ),
    WomenVisits AS (
        SELECT *
        FROM Visits v
        WHERE
            v.gender = 'female'
    ),
    BothVisits AS (
        SELECT mv.pizzeria_id, mv.pizzeria_name
        FROM MenVisits mv
        INTERSECT ALL
        SELECT wv.pizzeria_id, wv.pizzeria_name
        FROM WomenVisits wv
    ),
    MoreMen AS (
        SELECT mv.pizzeria_name
        FROM MenVisits mv
        EXCEPT ALL
        SELECT bv.pizzeria_name
        FROM BothVisits bv
    ),
    MoreWomen AS (
        SELECT wv.pizzeria_name
        FROM WomenVisits wv
        EXCEPT ALL
        SELECT bv.pizzeria_name
        FROM BothVisits bv
    )
SELECT *
FROM MoreMen
UNION ALL
SELECT *
FROM MoreWomen
ORDER BY pizzeria_name;