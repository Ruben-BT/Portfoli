use dbuoc;

CREATE TABLE IF NOT EXISTS contador(
projecto int key,
numero int
)


delimiter //
create trigger T3_2_1 after insert on dbuoc.empleats for each row
begin 
	update contador set numero = (select count(empleats.num_proj) from dbuoc.empleats where num_proj=new.num_proj) where new.num_proj=codi_proj ;
end //
delimiter ;

delimiter //
create trigger T3_2_2 after update on dbuoc.empleats for each row
begin 
	update contador set numero = (select count(empleats.num_proj) from dbuoc.empleats where num_proj=new.num_proj) where new.num_proj=codi_proj ;
end //
delimiter ;

delimiter //
create trigger T3_2_3 after delete on dbuoc.empleats for each row
begin 
	update contador set numero = (select count(empleats.num_proj) from dbuoc.empleats where num_proj=old.num_proj) where old.num_proj=codi_proj ;
end //
delimiter ;
