# PR6: Linear and Polynomial Regression

from sklearn.datasets import fetch_california_housing
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
from sklearn.metrics import mean_absolute_error, r2_score

# Load dataset
data = fetch_california_housing()

X = data.data[:, [0]]
y = data.target

# Split data
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Linear Regression
model1 = LinearRegression()
model1.fit(X_train, y_train)
pred1 = model1.predict(X_test)

# Polynomial Regression
poly = PolynomialFeatures(degree=2)
X_train_poly = poly.fit_transform(X_train)
X_test_poly = poly.transform(X_test)

model2 = LinearRegression()
model2.fit(X_train_poly, y_train)
pred2 = model2.predict(X_test_poly)

# Compare results
print("Linear Regression")
print("MSE:", mean_squared_error(y_test, pred1))
print("MAE:", mean_absolute_error(y_test, pred1))
print("R2:", r2_score(y_test, pred1))

print("\nPolynomial Regression")
print("MSE:", mean_squared_error(y_test, pred2))
print("MAE:", mean_absolute_error(y_test, pred2))
print("R2:", r2_score(y_test, pred2))
