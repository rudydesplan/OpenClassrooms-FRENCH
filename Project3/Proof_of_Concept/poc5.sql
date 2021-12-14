select bien.id_bien, adresse.codedp as code_departement, bien.surfc as nombre_M2, transaction.val as valeur_fonciere 

from bien natural join adresse natural join transaction 

where val>0 and typel = 'Appartement' 

group by id_bien,code_departement,nombre_M2,valeur_fonciere 

order by valeur_fonciere desc limit 10 