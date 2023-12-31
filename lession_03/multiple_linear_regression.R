# Multiple linear regression

# importing dataset
# dataset <- read.csv('C:/Users/gt3ix/PycharmProjects/pythonProject/lession_03/data/50_Startups.csv')
dataset <- read.csv('C:/Users/admin/Documents/GitHub/Machine-Learning-course/lession_03/data/50_Startups.csv')

# Encoding categorical data
dataset$State <- factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                          labels = c(1, 2, 3))

# Splitting in trainig and test dataset
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting multiple linear regression to the training set
regressor <- lm(formula = Profit ~ .,
                data = training_set)

# Predict the results
y_pred <- predict(regressor, newdata = test_set)

# Build the optional model using backward elimination
regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = dataset)
summary(regressor)

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = dataset)
summary(regressor)

regressor <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = dataset)
summary(regressor)