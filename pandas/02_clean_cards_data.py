import pandas as pd
cards_df = pd.read_csv(r"C:\Users\emman\Downloads\archive (6)\cards_data.csv")
pd.set_option('display.max_columns', None)
print(cards_df.dtypes)
print(cards_df.shape)
print(cards_df.describe())
cards_df["credit_limit"] = cards_df["credit_limit"].str.replace("$","",regex=False)
cards_df["credit_limit"]  = cards_df["credit_limit"].astype("float")
cards_df["expires"] = pd.to_datetime(cards_df["expires"],format ="%m/%Y",errors="coerce")
cards_df["expire_Year"] = cards_df["expires"].dt.year
print(cards_df["card_brand"].value_counts())
print(cards_df["card_type"].value_counts())
print(cards_df["card_type"].unique())
print(cards_df.isna().sum())
print(cards_df.duplicated().sum())
cards_df["has_chip"] = cards_df["has_chip"].str.title()
cards_df["acct_open_date"] = pd.to_datetime(cards_df["acct_open_date"],format = "%m/%Y",errors="coerce")
print(cards_df.dtypes)
print(cards_df[cards_df["num_cards_issued"] < 0])
print(cards_df.head(2))


