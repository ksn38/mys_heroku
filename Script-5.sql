/*SELECT DATE_ADD("2020-09-25", INTERVAL 46 DAY);*/
select DATE '2020-11-10' + INTERVAL '46 DAY';

/*drop view if exists chart;
create view chart as
select distinct a.id, a."name", ((b.val - a.val)*100/a.val) as cnd_val, ((b.val_noexp - a.val_noexp)*100/a.val_noexp) as cnd_vn, 
((b.res_vac - a.res_vac)*100/a.res_vac) as cnd_rv 
from mybl_lang a
left join  mybl_lang b on a."name"  = b."name" 
where b.date_added = current_date and a.date_added = '2020-11-20' order by cnd_val desc;*/

select * from mybl_lang ml where date_added = '2020-11-20';

select * from chart;

drop table if exists mean;
create table mean (
name varchar,
aval int,
aval_noexp int,
ares_vac numeric(9, 2)
);

insert into mean
select distinct name, avg(val) as aval, avg(val_noexp) as aval_noexp, avg(res_vac) as ares_vac from mybl_lang ml 
where date_added between '2020-11-20' and '2020-12-31' group by name;

select * from mean;

drop view if exists chart;
create view chart as
select distinct b.id, a."name", ((b.val - a.aval)*100/a.aval) as cnd_val, ((b.val_noexp - a.aval_noexp)*100/a.aval_noexp) as cnd_vn, 
((b.res_vac - a.ares_vac)*100/a.ares_vac)::integer as cnd_rv 
from mean a
left join  mybl_lang b on a."name"  = b."name" 
where b.date_added = current_date order by cnd_val desc;

select id, name, date_added, val from mybl_lang ml where name = 'Python' or name = 'Java' order by date_added , name;

select ml1.date_added as date_added,
ml1.val*ml1.res_vac as res_p,
ml2.val*ml2.res_vac as res_j,
ml3.val*ml3.res_vac as res_php,
ml4.val*ml4.res_vac as res_java,
ml5.val*ml5.res_vac as res_go,
ml6.val*ml6.res_vac as res_sc,
ml7.val*ml7.res_vac as res_ds
from mybl_lang ml1 
left join mybl_lang ml2 on ml1.date_added = ml2.date_added
left join mybl_lang ml3 on ml1.date_added = ml3.date_added
left join mybl_lang ml4 on ml1.date_added = ml4.date_added
left join mybl_lang ml5 on ml1.date_added = ml5.date_added
left join mybl_lang ml6 on ml1.date_added = ml6.date_added
left join mybl_lang ml7 on ml1.date_added = ml7.date_added
where ml1.name = 'Python' and ml2.name = 'Javascript' and ml3.name = 'php' and
ml4.name = 'Java' and  ml5.name = 'Go' and ml6.name = 'Scala' and ml7.name = 'Data scientist';

select * from mybl_lang ml where ml.date_added = current_date;

select * from mybl_lang ml where ml.name = 'c%2B%2B';

select case when name = 'c%2B%2B' then 'cpp' else name end  as name, res_vac
from mybl_lang ml where name = 'Java' or name = 'Javascript' or name = 'php' or name = 'c%2B%2B' 
order by date_added, ml.name;

update mean set name = 'cpp' where name = 'c%2B%2B';

select distinct b.id, a."name", ((b.val - a.aval)*100/a.aval) as cnd_val, ((b.val_noexp - a.aval_noexp)*100/a.aval_noexp) as cnd_vn, 
((b.res_vac - a.ares_vac)*100/a.ares_vac)::integer as cnd_rv,
(row_number() over(order by  ((b.val - a.aval)*100/a.aval) desc) + 
row_number() over(order by ((b.val_noexp - a.aval_noexp)*100/a.aval_noexp) desc) + 
row_number() over(order by ((b.res_vac - a.ares_vac)*100/a.ares_vac)::integer)) as rate
from mean a
left join  mybl_lang b on a."name"  = b."name" 
where b.date_added = current_date order by rate;

select distinct id, name, val, val_noexp, res_vac, 
(row_number() over(order by val desc) + row_number() over(order by val_noexp desc) + row_number() over(order by res_vac)) as rate
from mybl_lang ml where ml.date_added = current_date order by rate;

-- row_number() over(order by cnd_val desc) + row_number() over(order by cnd_vn desc) + row_number() over(order by cnd_rv)