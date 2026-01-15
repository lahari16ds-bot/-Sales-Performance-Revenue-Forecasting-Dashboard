import pandas as pd
from sklearn.linear_model import LinearRegression

# Load monthly sales data from SQL export
data = pd.read_csv("monthly_sales.csv")

# Convert month to numeric index
data["month_index"] = range(len(data))

X = data[["month_index"]]
y = data["monthly_revenue"]

# Train forecasting model
model = LinearRegression()
model.fit(X, y)

# Predict next 3 months (next quarter)
future_months = pd.DataFrame({
    "month_index": [len(data), len(data)+1, len(data)+2]
})

future_sales = model.predict(future_months)

forecast = pd.DataFrame({
    "month": ["Next Month", "Month +2", "Month +3"],
    "predicted_revenue": future_sales
})

forecast["quarter_total"] = forecast["predicted_revenue"].sum()

forecast.to_csv("next_quarter_forecast.csv", index=False)

print("Next quarter forecast created")
print(forecast)
