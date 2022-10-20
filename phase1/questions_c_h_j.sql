
/*
 c) Print the distinct genres in the database and their corresponding number of movies N where
N is greater than 1000, sorted in the ascending order of N.
 */

 select genre, count(distinct title) as N
from genres g, movies m
where g.mid = m.mid
group by genre
having count(distinct title) > 1000
order by N;

/*
 Let us find out who are the ’no flop’ actors. A ’no flop’ actor can be defined as one who has
played only in movies which have a rating greater than or equal to 4. We split this problem
into the following steps.
i. Create a view called high ratings which contains the distinct names of all actors who
have played in movies with a rating greater than or equal to 4. Similarly, create a view
called low ratings which contains the distinct names of all actors who have played in
movies with a rating less than 4. Print the number of rows in each view.
ii. Use the above views to print the number of ’no flop’ actors in the database.
iii. For each ’no flop’ actor, print the name of the actor and the number of movies N that
he/she played in, sorted in descending order of N. Finally, print the top 10 only.
 */

-- i
 create view high_ratings as
     select distinct name from actors a, movies m
    where a.mid = m.mid
    and rating >= 4
    order by name;

select * from high_ratings;

 create view low_ratings as
     select distinct name from actors a, movies m
    where a.mid = m.mid
    and rating < 4
    order by name;

select * from low_ratings;

-- ii
select count(name) no_flop_count from high_ratings
where name not in (select name from low_ratings);

-- iii
select a.name, count(m.title) from actors a, movies m
where a.mid = m.mid
and a.name in (select name from high_ratings)
and a.name not in (select name from low_ratings)
group by a.name
order by count(m.title) desc
limit 10;

/*
 (j) Let us find the close friends of Annette Nicole. Print the names of all actors who have starred
in (at least) all movies in which Annette Nicole has starred in. Note that it is OK if these
actors have starred in more movies than Annette Nicole has played in. Since PostgreSQL
does not provide a relational division operator, we will guide you through the following steps
(you might find it useful to consult the slides or the textbook for the alternative "double
negation" method of performing relational division).
*/

/* 1
First, create a view called co_actors, which returns the distinct names of actors who
played in at least one movie with Annette Nicole. Print the number of rows in this
view.
 */

create view co_actors as
    select distinct a1.name from actors a1, actors a2, movies m
where a1.mid = m.mid
and a2.mid = m.mid
and a2.name = 'Annette Nicole';

select count(*) from co_actors;

/* 2
Second, create a view called all_combinations which returns all possible combinations
of co_actors and the movie ids in which Annette Nicole played. Print the number of
rows in this view. Note how that this view contains fake (co_actor, mid) combinations!
 */

create view all_combinations as
    select ca.name, m.mid from co_actors ca
        cross join (select m.mid from movies m, actors a
                    where m.mid = a.mid
                    and a.name = 'Annette Nicole') as m
    where ca.name <> 'Annette Nicole';

-- correct because n(m) = 3, n(co_actors) = 179. n(m x co_actors) = n(m) * n(co_actors) = 537

select count(*) from all_combinations;

/* 3. Third, create a view called non_existent from the view all_combinations by removing
all legitimate (co_actor,mid) pairs (i.e., pairs that exist in the actors table). Print
the number of rows in this view.
 */
create view non_existent as
    select name, mid from all_combinations
    where (name, mid) not in (select name, mid from actors);

select * from non_existent;

select count(*) as rows_in_non_existent from non_existent order by name;

-- test for 3
select name, mid from non_existent
where (name, mid) in (select name, mid from actors);

/*
4. Finally, from the view co_actors, eliminate the distinct actors that appear in the view
non_existent. Print the names of all co_actors except Annette Nicole.
 */
select name from co_actors
where name not in (select distinct name from non_existent);
and name <> 'Annette Nicole';








