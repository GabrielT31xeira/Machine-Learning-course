# Import dataset
# Remenber dont use "\" for import datasets
dataset <- read.csv("C:/Users/gt3ix/PycharmProjects/pythonProject/lession_01/data/Data.csv")
print(dataset)

# Taking care of missing data
dataset$Age <- ifelse(is.na(dataset$Age),
                      ave(dataset$Age, FUN = function (x) mean(x, na.rm = TRUE)),
                      dataset$Age)

dataset$Salary <- ifelse(is.na(dataset$Salary),
                      ave(dataset$Salary, FUN = function (x) mean(x, na.rm = TRUE)),
                      dataset$Salary)

print(dataset)

# Encoding categorical data
dataset$Country <- factor(dataset$Country, levels = c('France','Spain' , 'Germany'), labels = c(1, 2, 3))
dataset$Purchased <- factor(dataset$Purchased, levels = c('Yes', 'No'), labels = c(0, 1))
print(dataset)
