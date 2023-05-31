-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\Zavrsni\RestoranZavrsni.sql
drop database if exists restoran;
create database restoran;

use restoran;

create table osoblje(
    sifra int not null primary key auto_increment,
    ime varchar (20) not null,
    prezime varchar (20) not null    
); 

create table gost(
    sifra int not null primary key auto_increment,
     ime varchar (20) not null,
     prezime varchar (20) not null,   
     kontakt varchar (20)

);

create table jelovnik(
     sifra int not null primary key auto_increment,
     naziv varchar (100) not null,
    cijena decimal (18.2) not null  

);
create table stavka(
    racun int,
    jelovnik int,
    kolicina int 
);

create table racun(
    sifra int not null primary key auto_increment,
    datum datetime,
    iznos decimal,
    gost int,
    osoblje int
);

alter table racun add foreign key (gost) references gost(sifra);
alter table racun add foreign key (osoblje) references osoblje(sifra);
alter table stavka add foreign key (racun) references racun(sifra);
alter table stavka add foreign key (jelovnik) references jelovnik(sifra);

select * from osoblje;

insert into osoblje (ime,prezime)values
	('Katarina','Suker'),
	('Martina','Sucic'),
	('Kristina','Bobinac');

select * from gost;

insert into gost (ime,prezime,kontakt)values
	('Marijana','Bicanic','095813568'),
	('Petra','Marijacic','012743569'),
	('Dominik','Petric','032333707');

select * from jelovnik;

insert into jelovnik (naziv,cijena)values
	('Pileći file, riža, povrće, salata','55.00'),
	('Ragu juha, punje paprike s krumpirom','45.00'),
	('Som, perkelt od povrća, desert','50.00');

select * from racun;

insert into racun(datum,iznos,gost,osoblje)values
	('2023-05-13 15:00','87.00',1,3),
	('2023-01-31 18:00','68.00',2,2),
	('2023-11-30 11:00','80.00',3,1);

 select * from stavka;

insert into stavka(racun,jelovnik,kolicina) values
	(2,3,2),
	(3,3,1),
	(2,1,2);