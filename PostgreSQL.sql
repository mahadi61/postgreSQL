-- Active: 1747797216887@@127.0.0.1@5432@conservation_db

CREATE DATABASE conservation_db;

--create rangers table
create table rangers (
    rangers_id SERIAL PRIMARY KEY,
    name VARCHAR(50) not null,
    region varchar(50) not null
)

--insert data into rangers table
insert INTO rangers (name,region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob white', 'River Delta'),
('coral king', 'mountain Range');



--select all from rangers table
select * from rangers

--create species table

CREATE table  species (
    species_id serial PRIMARY key,
    common_name VARCHAR(50) not null,
    scientific_name varchar(50) not null,
    discovery_date DATE not NULL,
    conservation_status VARCHAR(50) CHECK (
        conservation_status IN ('Endangered','Vulnerable', 'Historic')
    )

)


--insert data in species table

insert into species (common_name, scientific_name, discovery_date,conservation_status) VALUES 
('snow leopard','Panther uncia','1775-01-01','Endangered' ),
('Bengal Tiger','Panther tigris tigris','1758-01-01','Endangered' ),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable' ),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered' );

--select all data from species table
select * from species




-- crate sightings table
CREATE table sightings (
    sighting_id serial primary key,
    species_id int REFERENCES species(species_id),
    rangers_id int REFERENCES rangers(rangers_id),
    sighting_time TIMESTAMP not null,
    location VARCHAR(100) not null,
    note text

)

-- insert data in sightings table

insert into sightings (sighting_id, species_id, rangers_id, location,sighting_time,note) VALUES
(1,1,1, 'peak ridge', '2024-05-10 07:45:00', 'camera trap image captured'),
(2,2,2, 'Backwood area', '2024-05-12 16:20:00', 'juvenile seen'),
(3,3,3, 'Bamboo grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4,1,2, 'Snowfall pass', '2024-05-18 18:30:00', null);

SELECT * from sightings



--Question 1: register a new rangers
insert into rangers (name, region) VALUES('Derek Fox', 'Costal Plains');

--Question 2: Count unique species ever sighted
SELECT count(DISTINCT species_id) as unique_species_counts
from sightings

--Question 3: find sighting where location includes "pass"

select * from sightings
where location ILIKE '%pass%';

--Question 4: list each anger names and their total number of sighting

select rangers.name, count(sightings.sighting_id) from rangers
inner join sightings on rangers.rangers_id = sightings.rangers_id
group by rangers.name  
order by rangers.name;


--Question 5:list species that have never been sighted

select common_name from species
where species_id not in 
(select DISTINCT species_id from sightings);


--Question 6: show the most recent 2 sightings

select sp.common_name, s.sighting_time, r.name from sightings as s
join species as sp on s.species_id = sp.species_id
join rangers as r on s.rangers_id = r.rangers_id
order by s.sighting_time  DESC
LIMIT 2;


--Question 7: update all species discovered before 1800 status 'Historic'

update species
 set conservation_status = 'Historic'
 where discovery_date < '1800-01-01';  

--Question 8: label each sightings time of day as 'Morning','Afternoon',or 'Evening'
select sighting_id,
CASE 
    WHEN extract(hour from sighting_time) <12  THEN 'Morning'
    WHEN extract(hour from sighting_time) <17  THEN 'Afternoon'
 ELSE  'Evening'
END as time_of_day

from sightings
order by sighting_id;

--Question 9:Delete rangers who have never sighted any species

delete from rangers
where rangers_id not in (select DISTINCT rangers_id from sightings);

