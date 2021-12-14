with
Moyenne_Val06 as(
SELECT codedp as code_departement, avg(val/surfc) as valeur_moyenne, com as commune 
from adresse natural join bien natural join transaction 
where val>0 and codedp ='6' 
GROUP BY commune, code_departement ORDER BY valeur_moyenne DESC limit 3),
Moyenne_Val13 as(
SELECT codedp as code_departement, avg(val/surfc) as valeur_moyenne, com as commune 
from adresse natural join bien natural join transaction 
where val>0 and codedp ='13'
GROUP BY commune, code_departement ORDER BY valeur_moyenne DESC limit 3),
Moyenne_Val33 as(
SELECT codedp as code_departement, avg(val/surfc) as valeur_moyenne, com as commune 
from adresse natural join bien natural join transaction 
where val>0 and codedp ='33' 
GROUP BY commune, code_departement ORDER BY valeur_moyenne DESC limit 3),
Moyenne_Val59 as(
SELECT codedp as code_departement, avg(val/surfc) as valeur_moyenne, com as commune 
from adresse natural join bien natural join transaction 
where val>0 and codedp ='59' 
GROUP BY commune, code_departement ORDER BY valeur_moyenne DESC limit 3),
Moyenne_Val69 as(
SELECT codedp as code_departement, avg(val/surfc) as valeur_moyenne, com as commune 
from adresse natural join bien natural join transaction 
where val>0 and codedp ='69' 
GROUP BY commune, code_departement ORDER BY valeur_moyenne DESC limit 3)
select * from Moyenne_Val06 union all select * from Moyenne_Val13 union all
select * from Moyenne_Val33 union all select * from Moyenne_Val59 union all 
select * from Moyenne_Val69;