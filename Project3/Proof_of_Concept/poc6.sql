with
T1 as(
Select Count(id_transaction) as nbreventes1 
from transaction where val>0 and date Between '2020-01-01' and '2020-03-31'), 

T2 as(
Select Count(id_transaction) as nbreventes2 
from transaction where val>0 and date Between '2020-04-01' and '2020-06-30'), 

T3 as(
select nbreventes2-nbreventes1 as difference 
from T1,T2) 

select difference*100.0/nbreventes1 as taux_evolution_vente  
from T3 natural join T1 