-- Crea la base de datos
create database blog_db

-- Crea la tabla de usuarios
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

-- Añade 3 usuarios
insert into users (first_name, last_name, email) values
	('Josue', 'Vallejo', 'Josue@gmail.com'),
	('Raul', 'Fajardo', 'yesid@hotmail.com'),
	('Didier', 'Vallejo', 'yiyo@gmail.co');

select * from users;

-- Crea la tabla de posts
create table posts (
	id serial primary key,
	creator_id int references users(id),
	tittle varchar(50),
	text text
);

-- Añade 5 posts.
insert into posts (creator_id, tittle, text) values
	(1, 'Programación', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet'),
	(1, 'Videojuegos', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet'),
	(2, 'fitness', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet'),
	(3, 'Motivación', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet'),
	(3, 'Ingeniería', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet');

select * from posts;

-- Crea la tabla de likes
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

-- Añade 5 likes.
insert into likes (user_id, post_id) values
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 5),
	(3, 2);

select * from likes;

-- Trae todos los posts y la información del usuario del campo creator_id
select * from posts inner join users
on posts.creator_id = users.id;

-- Trae todos los posts, con la información de los usuarios que les dieron like.
select * from likes inner join users
on likes.user_id = users.id inner join posts
on likes.post_id = posts.id;
