use cine;
/*1- Ver las ciudades que tienen la pelicula 2*/
SELECT c.NombreCiudad FROM ciudades c,tiene t, peliculas p where  (p.Nombre=t.nombre_peliculas and c.cine_id=t.cine_id) and p.Nombre='peliculas2' group by c.NombreCiudad;
/*2- ver los dias que esta disponible la pelicula1 */
select f.dia from fechas f , peliculas p , esta e where (p.Nombre=e.nombre_peliculas and f.dia=e.dia_fechas) and p.Nombre='peliculas1'  group by f.dia;
/*3- En que salas esta la pelicula3*/
SELECT s.Numero , p.Nombre FROM salas s join esta e on s.Numero = e.Numero_salas join(select * from peliculas p where p.Nombre ='peliculas1' )p on e.nombre_peliculas = p.Nombre  group by p.Nombre='peliculas1'; 
/*4- Cuantos cines tiene esta ciudad*/ 
select count(c.id) from cines c join (select * from ciudades ci where ci.NombreCiudad='Madrid')ci on c.id = ci.cine_id ;
/*5- Ver que calles esta los cines de Barcelona*/
select c.calle from cines c , ciudades ci where c.id = ci.cine_id and ci.NombreCiudad='Barcelona' ;
/*6- La id del cine de esta Madrid*/
select c.id from cines c , ciudades ci where c.id = ci.cine_id and ci.NombreCiudad='Madrid';
/*7- Cuantas salas tiene este cine*/
select count(s.Numero) from salas s ,  cines c , peliculas p , tiene t , esta a  where s.Numero = a.Numero_salas and a.nombre_peliculas = p.Nombre and p.Nombre = t.nombre_peliculas and t.cine_id = c.id  and c.id = '1';
/*8- Cuantas entradas quedan Para la pelicula*/
select d.entradas from disponibilidad d , peliculas p where p.Nombre = d.nombre_peliculas and p.Nombre='peliculas1';
/*9- Ver el precios de las peliculas*/
select d.precio from disponibilidad d , peliculas p where p.Nombre = d.nombre_peliculas and p.Nombre='peliculas1';
/*10- ver la id del cine , la calle las peliculas que tiene y el precio en la ciudad de madrid*/
Select c.id , c.calle from cines c , ciudades ci where ci.cine_id = c.id and ci.NombreCiudad='Madrid'
union
Select d.nombre_peliculas , d.precio from ciudades ci ,disponibilidad d , tiene t ,peliculas p, cines c where d.nombre_peliculas = p.Nombre and p.Nombre = t.nombre_peliculas and t.cine_id = c.id and c.id =ci.cine_id and ci.NombreCiudad='Madrid';