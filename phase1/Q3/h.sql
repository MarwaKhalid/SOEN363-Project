CREATE VIEW high_ratings AS
    SELECT DISTINCT name FROM actors, movies WHERE
         actors.mid=movies.mid AND
         movies.rating>=4;

CREATE VIEW low_ratings AS
    SELECT DISTINCT name FROM actors, movies WHERE
         actors.mid=movies.mid AND
         movies.rating<4;

SELECT high_ratings.name as name, COUNT(movies) as N FROM high_ratings, movies, actors WHERE
    high_ratings.name NOT IN (SELECT name FROM low_ratings) AND
    actors.name=high_ratings.name AND
    actors.mid=movies.mid
group by high_ratings.name
order by N DESC
LIMIT 10;