-- the first part of the task

CREATE TABLE IF NOT EXISTS nodes (
    point1 varchar,
    point2 varchar,
    cost numeric
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('c', 'b', 35),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30),
       ('c', 'a', 15),
       ('a', 'c', 15),
       ('d', 'a', 20),
       ('a', 'd', 20);


-- the second part

CREATE VIEW tour_info AS
    WITH RECURSIVE paths AS (
    SELECT point1, point2,
           cost,
           point1 as tour
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    SELECT nodes.point1, nodes.point2,
           paths.cost + nodes.cost AS cost,
           paths.tour || ',' || nodes.point1 AS tour
    FROM paths
    JOIN nodes ON paths.point2 = nodes.point1
    WHERE tour NOT LIKE '%' || nodes.point1 || '%')

    SELECT cost AS total_cost,
           '{' || tour || ',' || point2 || '}' AS tour
    FROM paths
    WHERE length(tour) > 5 AND point2 = 'a'
    ORDER BY total_cost;

SELECT *
FROM tour_info
WHERE total_cost = (SELECT MIN(total_cost) FROM tour_info)
ORDER BY total_cost, tour;


-- the third part
SELECT *
FROM tour_info
WHERE total_cost = (SELECT MIN(total_cost) FROM tour_info) OR
      total_cost = (SELECT MAX(total_cost) FROM tour_info)
ORDER BY total_cost, tour;