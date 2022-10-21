SELECT name FROM actors, movies WHERE
       title='The Dark Knight' AND
       actors.mid=movies.mid
ORDER BY name ASC;
