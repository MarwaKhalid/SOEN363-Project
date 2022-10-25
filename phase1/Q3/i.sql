CREATE VIEW first_movie_years AS
    SELECT name, min(year) as year FROM actors, movies WHERE
        actors.mid=movies.mid
    group by name;

CREATE VIEW last_movie_years AS
    SELECT name, max(year) as year FROM actors, movies WHERE
        actors.mid=movies.mid
    group by name;

CREATE VIEW longevity AS
    SELECT first_movie_years.name as name, (last_movie_years.year - first_movie_years.year) as year FROM first_movie_years, last_movie_years WHERE
        first_movie_years.name=last_movie_years.name
    order by year DESC;

SELECT name FROM longevity LIMIT 1;