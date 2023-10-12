# simple linear regression
#import dataset
dataset <- read.csv("C:/Users/gt3ix/PycharmProjects/pythonProject/lession_02/data/Salary_Data.csv")

# Separe datasets
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Aply the simple linear regression
regressor <- lm(formula = Salary ~ YearsExperience,
                data <- training_set)

# Preditinc the test set results
y_pret <- predict(regressor, newdata = test_set)

# Install lib
# install.packages('ggplot2')
library('ggplot2')
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Years Experience (Training set)') +
  xlab('Years Experience') +
  ylab('Salary')

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Years Experience (Test set)') +
  xlab('Years Experience') +
  ylab('Salary')