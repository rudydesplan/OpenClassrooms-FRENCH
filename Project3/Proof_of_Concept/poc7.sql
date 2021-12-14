with
T1 as(
select count(id_transaction) as nombre_vente_T1, adresse.com as commune
from transaction natural join bien natural join adresse 
where val>0 and date between '2020-01-01' and '2020-03-31' 
group by commune
order by commune ASC),
T2 as ( 
select count(id_transaction) as nombre_vente_T2, adresse.com as commune
from transaction natural join bien natural join adresse
where val>0 and date between '2020-04-01' and '2020-06-30'
group by commune 
order by commune ASC) 
select nombre_vente_T1,nombre_vente_T2, nombre_vente_T2-nombre_vente_T1 as difference, commune,
(100.0*(nombre_vente_T2-nombre_vente_T1)/nombre_vente_T1) as evolution
from T1 natural join T2 natural join adresse 
where (100.0*(nombre_vente_T2-nombre_vente_T1)/nombre_vente_T1) >= 20
group by nombre_vente_T1, nombre_vente_T2, difference, commune
order by evolution ASC 