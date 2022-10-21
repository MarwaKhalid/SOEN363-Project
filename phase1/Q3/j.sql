CREATE VIEW co_actors AS
    SELECT DISTINCT name FROM movies, actors WHERE
        movies.mid=actors.mid AND
        EXISTS((SELECT name FROM actors WHERE
             actors.name='Annette Nicole' AND
             actors.mid=movies.mid)) AND
        name!='Annette Nicole';

CREATE VIEW all_combinations AS
    SELECT DISTINCT co_actors.name as name, movies.mid as mid FROM co_actors, movies, actors WHERE
         movies.mid=actors.mid AND
         EXISTS((SELECT name FROM actors WHERE
             actors.name='Annette Nicole' AND
             actors.mid=movies.mid));

CREATE VIEW non_existent AS
    SELECT name, mid FROM all_combinations WHERE
            NOT EXISTS((SELECT name FROM movies, actors WHERE
                            movies.mid=actors.mid AND
                            all_combinations.name=actors.name AND
                            movies.mid=all_combinations.mid));

SELECT name FROM co_actors WHERE
     NOT EXISTS((SELECT name FROM non_existent WHERE
                        co_actors.name=non_existent.name));