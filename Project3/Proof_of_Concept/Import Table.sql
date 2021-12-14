
# Import Table Adresse
--command " "\\copy public.adresse (id_adresse, codedp, com) 
FROM 'C:/Users/rudy/Desktop/DATAAN~1/Studies/OPENCL~1/P3/PROOF_~1/Adresse.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""

# Import Table Bien
--command " "\\copy public.bien (id_bien, id_adresse, typel, nbrepp, surfrb) 
FROM 'C:/Users/rudy/Desktop/DATAAN~1/Studies/OPENCL~1/P3/PROOF_~1/Bien.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""

#Import Table Transaction
--command " "\\copy public.bien (id_transaction, id_bien, date, naturemut, val) 
FROM 'C:/Users/rudy/Desktop/DATAAN~1/Studies/OPENCL~1/P3/PROOF_~1/Transaction.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""
