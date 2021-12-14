select count(distinct id_bien) as Nombre_total_appartements_vendus
from bien natural join  transaction
where val>0 and typel ='Appartement' and date between '2020-01-01' and '2020-06-30'