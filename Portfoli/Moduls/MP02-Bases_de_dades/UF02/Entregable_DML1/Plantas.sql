USE plantes ;
/*1*/SELECT p.nom_popular FROM planta p , exemplar_planta ep WHERE ep.nom_planta=p.nom_cientific GROUP BY nom_popular HAVING count(ep.num_exemplar)<2;
/*2*/SELECT p.nom_popular FROM planta p , exemplar_planta ep WHERE p.nom_cientific NOT IN(SELECT nom_planta from exemplar_planta) group by p.nom_cientific;
/*5*/use plantes;
select nom_popular
from planta, estacio
where nom_estacio!='Primavera';
/*8*/SELECT distinct nom_planta from reproduccio where metode_reproduccio<>'Esqueix';

/*9*/ SELECT pi.nom_planta from planta_interior pi, planta p where pi.nom_planta=p.nom_cientific and p.floracio='Primavera';