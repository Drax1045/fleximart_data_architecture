import pandas as pd
import mysql.connector
from datetime import datetime
from dateutil import parser
import re
import os

print("Starting FlexiMart ETL Pipeline")

# -------------------------
# FILE PATHS
# -------------------------
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
DATA_DIR = os.path.join(BASE_DIR, "data")

CUSTOMERS_FILE = os.path.join(DATA_DIR, "customers_raw.csv")
PRODUCTS_FILE = os.path.join(DATA_DIR, "products_raw.csv")
SALES_FILE = os.path.join(DATA_DIR, "sales_raw.csv")

# -------------------------
# DATA QUALITY METRICS
# -------------------------
report = {
    "customers": {"processed": 0, "duplicates": 0, "missing": 0, "loaded": 0},
    "products": {"processed": 0, "duplicates": 0, "missing": 0, "loaded": 0},
    "sales": {"processed": 0, "duplicates": 0, "missing": 0, "loaded": 0},
}

# -------------------------
# HELPER FUNCTIONS
# -------------------------
def clean_phone(phone):
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", phone)
    if len(digits) == 10:
        return f"+91-{digits}"
    if len(digits) == 12 and digits.startswith("91"):
        return f"+91-{digits[2:]}"
    return None

def clean_date(date_value):
    try:
        return parser.parse(str(date_value)).date()
    except:
        return None

def clean_category(cat):
    if pd.isna(cat):
        return None
    return cat.strip().capitalize()

# -------------------------
# DATABASE CONNECTION
# -------------------------
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Bruno@2002",
    database="fleximart"
)
cursor = conn.cursor()

# -------------------------
# EXTRACT
# -------------------------
customers = pd.read_csv(CUSTOMERS_FILE)
products = pd.read_csv(PRODUCTS_FILE)
sales = pd.read_csv(SALES_FILE)

report["customers"]["processed"] = len(customers)
report["products"]["processed"] = len(products)
report["sales"]["processed"] = len(sales)

# -------------------------
# TRANSFORM – CUSTOMERS
# -------------------------
before = len(customers)
customers.drop_duplicates(subset=["customer_id"], inplace=True)
report["customers"]["duplicates"] = before - len(customers)

customers["email"].fillna("unknown_" + customers["customer_id"] + "@fleximart.com", inplace=True)
report["customers"]["missing"] = customers["email"].isna().sum()

customers["phone"] = customers["phone"].apply(clean_phone)
customers["registration_date"] = customers["registration_date"].apply(clean_date)

# -------------------------
# LOAD – CUSTOMERS
# -------------------------
for _, row in customers.iterrows():
    try:
        cursor.execute("""
            INSERT INTO customers (first_name, last_name, email, phone, city, registration_date)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (
            row["first_name"],
            row["last_name"],
            row["email"],
            row["phone"],
            row["city"],
            row["registration_date"]
        ))
        report["customers"]["loaded"] += 1
    except Exception as e:
        print("Customer insert error:", e)

conn.commit()

# -------------------------
# WRITE DATA QUALITY REPORT
# -------------------------
report_path = os.path.join(os.path.dirname(__file__), "data_quality_report.txt")

with open(report_path, "w") as f:
    for table, stats in report.items():
        f.write(f"{table.upper()} DATA QUALITY REPORT\n")
        for k, v in stats.items():
            f.write(f"{k}: {v}\n")
        f.write("\n")

print("ETL Pipeline Completed Successfully")