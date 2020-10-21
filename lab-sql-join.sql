/* Lab | SQL Join
In this lab, you will be using the Sakila database of movie rentals.
Instructions
   
*/
use sakila;
select * from film;
# fields needed: film_id from film, name from category
# 1. List number of films per category.
select cat.name, count(f.film_id) from category as cat
join film_category as f_c on f_c.category_id = cat.category_id
join film as f on f.film_id = f_c.film_id
group by cat.name;
# 2. Display the first and last names, as well as the address, of each staff member.
select s.first_name,s.last_name, a.address from staff as s
join address as a on a.address_id = s.address_id; 

# 3. Display the total amount rung up by each staff member in August of 2005.
select * from payment;

select staff_id, sum(amount) from payment
group by staff_id;

select staff_id, sum(amount) from payment
where (payment_date between "2005-08-01 00:00:00" and "2005-08-31 23:59:59")
group by staff_id;

# 4. List each film and the number of actors who are listed for that film.
select * from actor;
select * from film;
select film_id, actor_id from film_actor
group by film_id;
select film_id, count(actor_id) as 'num_actors' from film_actor
group by film_id;
# let's get the name of the film
select f.title, count(actor_id) as 'num_actors' from film_actor as f_a
join film as f on f.film_id = f_a.film_id
group by title;

#5 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select customer_id, amount from payment
group by customer_id;
select * from customer;

select c.first_name, c.last_name, sum(p.amount) as 'money_spent' from payment as p
join customer as c on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name;




