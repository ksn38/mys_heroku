select * from mybl_ticker order by id desc;

-- SELECT * FROM information_schema.sequences;
-- ALTER SEQUENCE mybl_tickers_id_seq RESTART WITH 1;


-- truncate mybl_ticker restart identity;


-- insert into mybl_ticker(date_added, gspc, vix, tnx) values('2020-12-13', 4, 4, 4);
-- delete from mybl_ticker where id = 1013;


select current_date - 1;

select * from mybl_ticker mt order by date_added desc;

drop view if exists chart_tickers;
create view chart_tickers as
(select mt2.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx,
round((mt.ixic/mt2.ixic - 1) * 10000)/100 as dif_ixic,
round((mt.rut/mt2.rut - 1) * 10000)/100 as dif_rut, 
round((mt.wti/mt2.wti - 1) * 10000)/100 as dif_wti,
round((mt.gold/mt2.gold - 1) * 10000)/100 as dif_gold
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 1 
where mt.id = (select max(mt.id) from mybl_ticker mt))
union
(select mt2.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx,
round((mt.ixic/mt2.ixic - 1) * 10000)/100 as dif_ixic,
round((mt.rut/mt2.rut - 1) * 10000)/100 as dif_rut, 
round((mt.wti/mt2.wti - 1) * 10000)/100 as dif_wti,
round((mt.gold/mt2.gold - 1) * 10000)/100 as dif_gold
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 20
where mt.id = (select max(mt.id) from mybl_ticker mt))
union
(select mt2.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx,
round((mt.ixic/mt2.ixic - 1) * 10000)/100 as dif_ixic,
round((mt.rut/mt2.rut - 1) * 10000)/100 as dif_rut, 
round((mt.wti/mt2.wti - 1) * 10000)/100 as dif_wti,
round((mt.gold/mt2.gold - 1) * 10000)/100 as dif_gold
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 50 
where mt.id = (select max(mt.id) from mybl_ticker mt))
union
(select mt2.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx,
round((mt.ixic/mt2.ixic - 1) * 10000)/100 as dif_ixic,
round((mt.rut/mt2.rut - 1) * 10000)/100 as dif_rut, 
round((mt.wti/mt2.wti - 1) * 10000)/100 as dif_wti,
round((mt.gold/mt2.gold - 1) * 10000)/100 as dif_gold
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 100 
where mt.id = (select max(mt.id) from mybl_ticker mt))
union
(select mt2.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx,
round((mt.ixic/mt2.ixic - 1) * 10000)/100 as dif_ixic,
round((mt.rut/mt2.rut - 1) * 10000)/100 as dif_rut, 
round((mt.wti/mt2.wti - 1) * 10000)/100 as dif_wti,
round((mt.gold/mt2.gold - 1) * 10000)/100 as dif_gold
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 250 
where mt.id = (select max(mt.id) from mybl_ticker mt))
union
(select mt2.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx,
round((mt.ixic/mt2.ixic - 1) * 10000)/100 as dif_ixic,
round((mt.rut/mt2.rut - 1) * 10000)/100 as dif_rut, 
round((mt.wti/mt2.wti - 1) * 10000)/100 as dif_wti,
round((mt.gold/mt2.gold - 1) * 10000)/100 as dif_gold
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 1000 
where mt.id = (select max(mt.id) from mybl_ticker mt))
order by id desc;

select * from mybl_ticker mt where id > (select max(id) from mybl_ticker mt2) - 250;


select * from mybl_ticker mt where id = (select max(mt.id) from mybl_ticker mt) - 500;

(select mt.id, round((mt.gspc/mt2.gspc - 1) * 10000)/100 as dif_gspc,
round((mt.vix/mt2.vix - 1) * 10000)/100 as dif_vix, 
round((mt.tnx/mt2.tnx - 1) * 10000)/100 as dif_tnx
from mybl_ticker mt
left join mybl_ticker mt2 on mt2.id = mt.id - 500 
where mt.id = (select max(mt.id) from mybl_ticker mt));

select 
-- left join mybl_ticker mt2 on mt.id = 1000 and mt2.id = 1001 order by mt.id desc);

select * from mybl_ticker order by id desc;
select gspc from mybl_ticker order by id desc limit 1;



SELECT avg(vix) OVER() AS total
FROM mybl_ticker mb;

select round((mt.gspc/mt2.gspc - 1) * 100)/100 as dif 
from mybl_ticker mt 
left join mybl_ticker mt2 on mt.date_added = mt2.date_added - 365 limit 1;

update mybl_ticker set wti = 0 where wti <= 0;
