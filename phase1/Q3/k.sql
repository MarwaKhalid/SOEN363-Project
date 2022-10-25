/* Count Tom Cruise's co-actors */
CREATE VIEW tom_movies AS
    SELECT DISTINCT name, actors.mid as mid FROM movies, actors WHERE
        name='Tom Cruise';

SELECT tom_movies.name as name, COUNT(DISTINCT actors)FROM tom_movies, actors WHERE
            tom_movies.mid=actors.mid AND
            actors.name!='Tom Cruise'
group by tom_movies.name;

/* Find most social actor */
CREATE VIEW num_of_co_actors AS
    SELECT actors.name as name, COUNT(DISTINCT actors1) as co_actors FROM actors
        INNER JOIN actors as actors1 on actors.mid = actors1.mid WHERE
            actors.name != actors1.name
    group by actors.name
    ORDER BY co_actors DESC;

SELECT * FROM num_of_co_actors WHERE
    co_actors=(SELECT MAX(num_of_co_actors1.co_actors)
               FROM num_of_co_actors as num_of_co_actors1);

/* TODO: account for ties and print in alphabetical order (although there is no tie) */


