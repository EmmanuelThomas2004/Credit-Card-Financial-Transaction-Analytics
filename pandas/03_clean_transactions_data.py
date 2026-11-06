import pandas as pd
transactions_df = pd.read_csv(r"C:\Users\emman\Downloads\archive (6)\transactions_data.csv",nrows=100000,low_memory=False)
pd.set_option('display.max_columns', None)
print(transactions_df.head(2))
print("Total rows and colums:",transactions_df.shape)
print(transactions_df.describe())
transactions_df["date"] = pd.to_datetime(transactions_df["date"])
print(transactions_df.dtypes)
transactions_df["amount"] = transactions_df["amount"].str.replace("$","",regex=False)
transactions_df["Date"] = transactions_df["date"].dt.date
transactions_df = transactions_df.drop(columns= ["date"])
transactions_df["merchant_city"] = transactions_df["merchant_city"].str.title()
print("use chip counts :",transactions_df["merchant_city"].value_counts())
transactions_df  = transactions_df.drop(columns= "errors")
print("merchantsate count",transactions_df["merchant_state"].value_counts())
transactions_df["merchant_state"] = transactions_df["merchant_state"].str.replace({"CA": "California",
    "TX": "Texas","NY": "New York","FL": "Florida","ND": "North Dakota","IA": "Iowa",
    "IN": "Indiana","MD": "Maryland","HI": "Hawaii",
    "PA": "Pennsylvania",
    "WI": "Wisconsin",
    "GA": "Georgia",
    "AL": "Alabama",
    "CT": "Connecticut",
    "WA": "Washington",
    "MA": "Massachusetts",
    "CO": "Colorado",
    "NJ": "New Jersey",
    "OK": "Oklahoma",
    "MT": "Montana",
    "AZ": "Arizona",
    "KY": "Kentucky",
    "LA": "Louisiana",
    "IL": "Illinois",
    "OH": "Ohio",
    "MO": "Missouri",
    "MI": "Michigan",
    "KS": "Kansas",
    "NC": "North Carolina",
    "AR": "Arkansas",
    "TN": "Tennessee",
    "NM": "New Mexico",
    "SC": "South Carolina",
    "MN": "Minnesota",
    "NV": "Nevada",
    "OR": "Oregon",
    "VA": "Virginia",
    "SD": "South Dakota",
    "WV": "West Virginia",
    "ME": "Maine",
    "MS": "Mississippi",
    "RI": "Rhode Island",
    "NH": "New Hampshire",
    "DE": "Delaware",
    "VT": "Vermont",
    "ID": "Idaho",
    "NE": "Nebraska",
    "DC": "District of Columbia",
    "UT": "Utah",
    "WY": "Wyoming",
    "AK": "Alaska"
})
print(transactions_df["merchant_state"].unique())
print("Total Null values",transactions_df.isnull().sum())
print("Total null per count",(transactions_df.isnull().sum())*100/len(transactions_df))
transactions_df["merchant_state"] =  transactions_df["merchant_state"].fillna("Unknown")
print("Total Null values",transactions_df.isnull().sum())
print("Total Duplicates :",transactions_df.duplicated().sum())
print(transactions_df["merchant_city"].unique())
print(transactions_df.head(5))
id_Check  = transactions_df["id"].value_counts()
print("idduplicatetotalsum",(id_Check> 1).sum())
clientidcheck = transactions_df["client_id"].value_counts()
print("clientid duplicaes sum ",( clientidcheck > 1).sum())
print(clientidcheck[clientidcheck > 1])
duplicate_clients = transactions_df[transactions_df.duplicated(subset=['client_id'], keep=False)]
print(duplicate_clients)
transactions_df["amount"] = transactions_df["amount"].astype(float)
transactions_df["Date"] = pd.to_datetime(transactions_df["Date"])
print(transactions_df.dtypes)
duplicatescards = transactions_df.groupby("client_id").agg(cardcount = ("card_id", "nunique"))
print(duplicatescards[duplicatescards["cardcount"] < 1].sum())
print(transactions_df.head(2))