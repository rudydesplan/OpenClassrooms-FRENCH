select bien.typel as type_local, bien.nbrepp as nombre_pieces_principales, count(id_transaction) as nombre_vente,

(SELECT COUNT(id_transaction) from bien natural join transaction where val>0 and typel = 'Appartement') as total,

100.0*(count(id_transaction))/(SELECT COUNT(id_transaction) from bien natural join transaction where val>0 and typel = 'Appartement') as ratio

from bien natural join transaction 

where val>0 and typel = 'Appartement' group by type_local, nombre_pieces_principales 
order by nombre_pieces_principales