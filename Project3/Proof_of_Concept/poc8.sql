with 
Deux_Pieces as(
select avg(val/surfc) as Deux_Pieces_PrixM2
From transaction natural join bien 
where val>0 and nbrepp =2 and typel ='Appartement'),

Trois_Pieces as( 
select avg(val/surfc) as Trois_Pieces_PrixM2 
From transaction natural join bien 
where val>0 and nbrepp =3 and typel ='Appartement'),

Diff as ( 
select Trois_Pieces_PrixM2-Deux_Pieces_PrixM2 as difference 
from Deux_Pieces,Trois_Pieces) 
select Deux_Pieces_PrixM2, Trois_Pieces_PrixM2 , difference,
(difference*100.0 / Deux_Pieces_PrixM2) as Difference_pourcentage
from Deux_Pieces,Trois_Pieces,Diff