use acb;

delimiter //
create trigger ex61_1 after insert on partits for each row
begin 
if((select count(*) from classificacio where equip = new.equip_local) = 0)then
insert into classificacio(equip)values(new.equip_local);
end if;
if((select count(*) from classificacio where equip = new.equip_local) = 1)then
update classificacio set partits_guanyats = partits_guanyats+1 where new.equip_local = equip and new.gols_local > new.gols_visitant;
update classificacio set partits_empatats = partits_empatats+1 where new.equip_local = equip and new.gols_local = new.gols_visitant;
update classificacio set partits_perduts = partits_perduts+1 where new.equip_local = equip and new.gols_local < new.gols_visitant;
update classificacio set gols_favor = (select sum(gols_local) from partits where equip_local = new.equip_local) where new.equip_local = equip;
update classificacio set gols_contra = (select sum(gols_visitant) from partits where equip_local = new.equip_local) where new.equip_local = equip;
end if;
end //
delimiter ;

delimiter //
create trigger ex61_2 after delete on partits for each row
begin
update classificacio set partits_guanyats = partits_guanyats-1 where old.equip_local = equip and old.gols_local > old.gols_visitant;
update classificacio set partits_empatats = partits_empatats-1 where old.equip_local = equip and old.gols_local = old.gols_visitant;
update classificacio set partits_perduts = partits_perduts-1 where old.equip_local = equip and old.gols_local < old.gols_visitant;
update classificacio set gols_favor = gols_favor-(select sum(gols_local) from partits where equip_local = old.equip_local) where old.equip_local = equip;
update classificacio set gols_contra = gols_contra -(select sum(gols_visitant) from partits where equip_local = old.equip_local) where old.equip_local = equip;
end //
delimiter ;

delimiter //
create trigger ex61_3 after update on partits for each row
begin 
if((select count(*) from classificacio where equip = new.equip_local) = 0)then
insert into classificacio(equip)values(new.equip_local);
end if;
if((select count(*) from classificacio where equip = new.equip_local) = 1)then
update classificacio set partits_guanyats = partits_guanyats+1 where new.equip_local = equip and new.gols_local > new.gols_visitant;
update classificacio set partits_empatats = partits_empatats+1 where new.equip_local = equip and new.gols_local = new.gols_visitant;
update classificacio set partits_perduts = partits_perduts+1 where new.equip_local = equip and new.gols_local < new.gols_visitant;
update classificacio set gols_favor = (select sum(gols_local) from partits where equip_local = new.equip_local) where new.equip_local = equip;
update classificacio set gols_contra = (select sum(gols_visitant) from partits where equip_local = new.equip_local) where new.equip_local = equip;
end if;
update classificacio set partits_guanyats = partits_guanyats-1 where old.equip_local = equip and old.gols_local > old.gols_visitant;
update classificacio set partits_empatats = partits_empatats-1 where old.equip_local = equip and old.gols_local = old.gols_visitant;
update classificacio set partits_perduts = partits_perduts-1 where old.equip_local = equip and new.gols_local < new.gols_visitant;
update classificacio set gols_favor = gols_favor-(select sum(gols_local) from partits where equip_local = old.equip_local) where old.equip_local = equip;
update classificacio set gols_contra = gols_contra -(select sum(gols_visitant) from partits where equip_local = old.equip_local) where old.equip_local = equip;
end //
delimiter ;

delimiter//
create trigger ex61_4 after insert on partits for each row
begin
if((select count(equip) from classifica where new.equip_local = equip) = 0)then
insert into classifica values(new.equip_local,(select count(partits_guanyats)*3 from classificacio where equip = new.equip_local),(select sum(gols_local) from ))
end if
end //
delimiter ;

select * from partits;
select * from classificacio;
insert into partits values(3,"Atletic Terrassa","Ràpid Vacarisses", 40,40);

