 select avg(val/surfc) as Prix_moyen_M2_maison_IDF 
 
 from transaction natural join bien natural join adresse
 
 where val>0 and typel = 'Maison' and codedp IN ('75','77','78','91','92','93','94','95')