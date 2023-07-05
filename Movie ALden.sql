use [4nm21ai010actor]
CREATE TABLE actor
(
    act_id varchar(5),
    act_name varchar(15),
    act_gender varchar(6),
    PRIMARY KEY (act_id)
);

CREATE TABLE director
(
    dir_id varchar(5),
    dir_name varchar(15),
    dir_phone bigint,
    PRIMARY KEY (dir_id)
);

CREATE TABLE movies
(
    mov_id varchar(5),
    mov_title varchar(15),
    mov_year int,
    mov_lang varchar(5),
    dir_id varchar(5),
    PRIMARY KEY (mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id) ON DELETE CASCADE
);

CREATE TABLE movie_cast
(
    act_id varchar(5),
    mov_id varchar(5),
    role varchar(10),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id) ON DELETE CASCADE,
    FOREIGN KEY (mov_id) REFERENCES movies(mov_id) ON DELETE CASCADE
);

CREATE TABLE rating
(
    rat_id varchar(5),
    mov_id varchar(5),
    rev_stars int,
    PRIMARY KEY (rat_id),
    FOREIGN KEY (mov_id) REFERENCES movies(mov_id) ON DELETE CASCADE
);
INSERT INTO actor VALUES
('A0001', 'Tom', 'Male'),
('A0002', 'Meryl', 'Female'),
('A0003', 'Leonardo', 'Male'),
('A0004', 'Tom', 'Male'),
('A0005', 'Scarlett', 'Female'),
('A0006', 'Brad', 'Male');

INSERT INTO director VALUES
('D0001', 'Steven', 1234567890),
('D0002', 'Christopher', 9876543210),
('D0003', 'Quentin', 5678901234),
('D0006', 'Steven', 1234567890),
('D0004', 'James', 9876543210),
('D0005', 'Martin ', 5678901234);

INSERT INTO movies VALUES
('M0001', 'Saving', 1998, 'Eng', 'D0001'),
('M0002', 'Incept', 2010, 'Eng', 'D0002'),
('M0003', 'Pulp', 1994, 'Eng', 'D0003'),
('M0006', 'Saving', 1998, 'Eng', 'D0001'),
('M0004', 'Dark', 2008, 'Eng', 'D0002'),
('M0005', 'Fight', 1999, 'Eng', 'D0006');

INSERT INTO movie_cast VALUES
('A0001', 'M0001', 'Captain'),
('A0002', 'M0001', 'Ryan'),
('A0003', 'M0002', 'Cobb'),
('A0004', 'M0004', 'Joker'),
('A0005', 'M0005', 'Durden'),
('A0001', 'M0002', 'Cobb');

INSERT INTO rating VALUES
('R0001', 'M0001', 4),
('R0002', 'M0002', 5),
('R0003', 'M0003', 4),
('R0004', 'M0001', 5),
('R0005', 'M0004', 4),
('R0006', 'M0005', 5);

select * from rating;




--1.
select mov_title from movies m,director d where m.dir_id = d.dir_id and d.dir_id='Christopher';
--2.Find the Movie names where one or more actors acted in two or more movies.
select distinct mov_title from movies m,movie_cast mc where m.mov_id = mc.mov_id and (select count(mov_id) from  movie_cast where act_id = mc.act_id)>=2;
--3.list aall actors who acted in amovie before 2000 and also in a movie after 2015(use JOIN operation).
select act_name from actor a join movie_cast mc on a.act_id = mc.act_id join movies m on mc.mov_id=m.mov_id where m.mov_year<2004 intersect select act_name from actor a join movie_cast mc on a.act_id= mc.act_id join movies m on mc. mov_id=m.mov_id where m.mov_year>2010;
--4.Find the ttitle of movies and number of stars for each movie that has at least one rating and find the highest number of stars for each movie after 2015(use JOIN operation).
select mov_title ,max(rev_stars) from movies m,rating r where m.mov_id = r.mov_id group by m.mov_title,m.mov_id order by m.mov_title;
--5.Update the rating of all movies released in each year in each language

--6.FInd the coount of  movies released in each year in each language
select mov_year,mov_lang,count(mov_id) from movies group by mov_year ,mov_lang;
--7.find the total number of movies directed by each director.
select d.dir_id,dir_name,count(mov_id) from director d,movies m where d.dir_id=m.dir_id group by d.dir_id,dir_name;