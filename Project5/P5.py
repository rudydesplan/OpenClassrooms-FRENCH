import pandas as pd
import scipy.stats as stats
import matplotlib.pyplot as plt
import numpy as np
import warnings
warnings.simplefilter("ignore")

erp = pd.read_excel("C:/Users/rudy/Desktop/Data Analyst/FRANCE/OpenClassroom/P5/erp.xlsx")
erp.sort_values(by="product_id", inplace = True)
liaison = pd.read_excel("C:/Users/rudy/Desktop/Data Analyst/FRANCE/OpenClassroom/P5/liaison.xlsx")
liaison.rename(columns={"id_web": "sku"},inplace=True)
liaison.dropna(subset=["sku"],inplace = True)
web = pd.read_excel("C:/Users/rudy/Desktop/Data Analyst/FRANCE/OpenClassroom/P5/web.xlsx")
web.dropna(subset=["sku","tax_status"],inplace = True)

def testCle(df, colonnes):
    """Fonction qui prend en arguments un dataframe et les colonnes qui composent la clé primaire à tester."""

    # On compare la taille du dataframe avant et après dédoublonnage 
    if df.size == df.drop_duplicates(colonnes).size :
        print("La clé n'est pas présente plusieurs fois dans le dataframe.")
        print("Elle peut donc être utilisée comme clé primaire.".format(colonnes))
    else :
        print("La clé est présente plusieurs fois dans le dataframe.")
        print("Elle ne peut donc pas être utilisée comme clé primaire.".format(colonnes))
    
    # On renvoie également le comptage
    print("Le dataframe est de la forme : " + str(df.shape) + " (lignes, colonnes)")

#print(erp.dtypes)
#print(erp.isnull().any())
#print(erp.duplicated().sum())

#print(liaison.dtypes)
#print(liaison.isnull().any())
#print(liaison.duplicated().sum())

#print(web.dtypes)
#print(web["sku"].isnull().any())
#print(web.duplicated().sum())

erp2=pd.merge(erp,liaison)
erp2=erp2[["product_id","sku","onsale_web","stock_status","stock_quantity","price"]]
erp3=pd.merge(erp2,web)

erp4=erp3[["product_id","total_sales","price"]]
erp4= erp4[erp4["total_sales"] != 0.0]
erp4["CA"]= erp4["total_sales"]*erp4["price"]
#print(erp4)
Total_CA=sum(erp4["CA"])
print(f"Le chiffre d'affaire Total est: {Total_CA}")
erp5=erp3[["product_id","price"]]
erp5.sort_values(by="price", inplace = True)

upper_quartile = erp5["price"].quantile(0.75)
lower_quartile = erp5["price"].quantile(0.25)
iqr = upper_quartile - lower_quartile
Maximum=upper_quartile+1.5*iqr
#print(Maximum)

mean = erp5["price"].mean()
std = erp5["price"].std()
erp5["zscores"] = stats.zscore(erp5["price"])
print(erp5[erp5["zscores"] > 2])
#print(erp5b.info())

Q1  = np.quantile(erp5["price"], 0.25)
Q3  = np.quantile(erp5["price"], 0.75)
IQR = Q3-Q1
Min = Q1-1.5*IQR
Max = Q3+1.5*IQR
print(erp5[erp5["price"] > Max])

#print(erp6)
#print(erp6.info())
flierprops = dict(marker='o', markerfacecolor='r', markersize=6,linestyle='none', markeredgecolor='g')
#plt.boxplot(erp5["price"],flierprops=flierprops)
#plt.show()