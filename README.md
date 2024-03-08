# Traveling Salesman Problem

Here is a simple bruteforce solution of Travelling Salesman Problem.
The task was given by School21 as part of the SQL bootcamp.
<p>

There are 4 cities (a, b, c and d) and arcs between them with costs.
The travel costs are symmetric (traveling from city X to city Y costs just as much as traveling from Y to X).

![paths](images/tour_scheme.png)

<p>

The first part of the task is to create a table with name `nodes` by using structure `{point1, point2, cost}` and fill data based on a picture.
<br>

The second part is to write one SQL statement that returns all tours with minimal traveling cost starting from city __a__, sorted by total cost and then by tours.

The output should look like:
| total_cost |     tour    |
|   :---:    |     :---:   |
|     80     | {a,b,d,c,a} |
|     80     | {a,c,d,b,a} |

<br>

And the last part is to add a possibility to see additional rows with the most expensive cost to the SQL statement from previous part. Also the output should be sorted by total cost and then by tours.
The output should look like:

| total_cost |     tour    |
|   :---:    |     :---:   |
|     80     | {a,b,d,c,a} |
|    ...     |     ...     |
|    95      | {a,d,c,b,a} |

<p>

The solution had to have a certain SQL syntax pattern – _Recursive Query_