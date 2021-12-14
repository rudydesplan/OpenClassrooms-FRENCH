select adresse.codedp, ROUND(AVG(val/surfc) ,2) AS Prix_M2 
From transaction natural join bien natural join adresse 
where surfc>0 and val>0 
Group by codedp 
order by Prix_M2 DESC Limit 10;