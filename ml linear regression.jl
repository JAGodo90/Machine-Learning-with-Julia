using Pkg
Pkg.add("ScikitLearn")

Pkg.add("CSV")

using CSV

using ScikitLearn

# collecting iris dataset directly from Julia
# normalizenames corrects the columns names of this dataset
iris = CSV.read("iris.csv",normalizenames = true)

# in Julia datasets are arrays, so we to convert with convert() function
# iris_x is our dependent variable
iris_x = convert(Array,iris[:,[1,2,3,4]]); # I want everything from coluns 1 to 4

# applying the convert method on target variable Y (column 5)
iris_y = convert(Array,iris[:,5]);

# importing Logistic Regression
@sk_import linear_model: LogisticRegression

# applying LR to our variable
log_reg_model = LogisticRegression()

# fitting the model with LR, dependent variables and target variable
fit!(log_reg_model, iris_x, iris_y)

# prediction
prediction = predict(log_reg_model, iris_x)

# importting accuracy method
@sk_import metrics: accuracy_score

# checking accuracy on target variables
accuracy = accuracy_score(predictions, iris_y)
