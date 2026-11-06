import pandas as pd
users_df = pd.read_csv(r"C:\Users\emman\Downloads\archive (6)\users_data.csv")
print(users_df.columns)
print(users_df.info())
print("Total Null values:",users_df.isna().sum())
print("Total Duplicates:",users_df.duplicated().sum())
print(users_df.dtypes)
users_df["total_debt"] = users_df["total_debt"].str.replace("$","",regex=False)
users_df["total_debt"] = pd.to_numeric(users_df["total_debt"])
cols = ["per_capita_income","yearly_income"]
for  col in cols:
    users_df[col] = users_df[col].str.replace("$","",regex=False)
    users_df[col] = pd.to_numeric(users_df[col])
print(users_df.dtypes)
print(users_df.head(3))
print("negativeage",(users_df["current_age"] < 0).sum())
primarykeyduplicates = users_df["id"].value_counts()
print("Totalpk duplicates:",(primarykeyduplicates > 1).sum())
print("Invalidbirthmonth:",(users_df["birth_month"] > 12).sum())
print("GenderCounts",users_df["gender"].value_counts())
cols = users_df.select_dtypes(include="str").columns
for col in cols:
    users_df[col] = users_df[col].str.strip()
print(users_df.head(3))
