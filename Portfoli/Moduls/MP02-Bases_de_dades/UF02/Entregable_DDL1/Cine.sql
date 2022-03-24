CREATE DATABASE IF NOT EXISTS cine;
use cine;

CREATE TABLE IF NOT EXISTS Salas(Numero int,
PRIMARY KEY (Numero)
);
CREATE TABLE IF NOT EXISTS Peliculas(Nombre CHAR(40),
duracion int,
PRIMARY KEY (Nombre)
); 
CREATE TABLE IF NOT EXISTS Fechas(dia DATE,
hora TIME,
PRIMARY KEY (dia)
);
CREATE TABLE IF NOT EXISTS cines(id int,
calle CHAR(80),
PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Ciudades(NombreCiudad CHAR(40),cine_id int,
FOREIGN KEY (cine_id) REFERENCES cines(id),
PRIMARY KEY (NombreCiudad)
);
CREATE TABLE IF NOT EXISTS Esta(Numero_salas int,dia_fechas DATE,nombre_peliculas char(40),
FOREIGN KEY (Numero_salas) REFERENCES Salas(Numero),
FOREIGN KEY (dia_fechas) REFERENCES Fechas(dia),
FOREIGN KEY (nombre_peliculas) REFERENCES Peliculas(Nombre)
);
CREATE TABLE IF NOT EXISTS Tiene(nombre_peliculas char(40),cine_id int,
FOREIGN KEY (nombre_peliculas) REFERENCES Peliculas(Nombre),
FOREIGN KEY (cine_id) REFERENCES cines(id)
);

INSERT INTO Salas VALUES('1'),
                        ('2'),
                        ('3'),
                        ('4'),
                        ('5');
INSERT INTO Peliculas VALUES('peliculas1','60'),
                        ('peliculas2','60'),
                        ('peliculas3','60'),
                        ('peliculas4','60'),
                        ('peliculas5','60');
INSERT INTO Fechas VALUES('2021-12-01','13:40'),
                        ('2021-12-02','13:40'),
                        ('2021-12-03','13:40'),
                        ('2021-12-04','13:40'),
                        ('2021-12-05','13:40');
INSERT INTO cines VALUES('01','Maria'),
                        ('02','Felipe'),
                        ('03','Manuel'),
                        ('04','Jose'),
                        ('05','Jorge');
INSERT INTO Ciudades VALUES('Madrid','01'),
                        ('Barcelona','02'),
                        ('Valencia','03'),
                        ('Sevilla','04'),
                        ('Zaragoza','05');
INSERT INTO Esta VALUES('1','2021-12-01','peliculas1'),
                        ('1','2021-12-01','peliculas1'),
                        ('1','2021-12-01','peliculas1'),
                        ('1','2021-12-01','peliculas1'),
                        ('1','2021-12-01','peliculas1');
INSERT INTO Tiene VALUES('peliculas1','01'),
                        ('peliculas1','02'),
                        ('peliculas1','03'),
                        ('peliculas1','04'),
                        ('peliculas1','05');
ALTER TABLE Peliculas ADD descripcio CHAR(4);
ALTER TABLE Peliculas MODIFY descripcio CHAR(20);
ALTER TABLE Peliculas RENAME PeliculasCambios;
ALTER TABLE PeliculasCambios DROP descripcio;
ALTER TABLE PeliculasCambios RENAME Peliculas;
ALTER TABLE cines ADD descripcio CHAR(5);
ALTER TABLE cines MODIFY descripcio CHAR(50);
ALTER TABLE cines RENAME cines_acces;
ALTER TABLE cines_acces DROP descripcio;
ALTER TABLE cines_acces RENAME cines;

