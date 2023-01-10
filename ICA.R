
library("caret")                   # Loading the caret package for the Support Vector Machine
Stroke <- read.csv(file.choose(), header = TRUE)    #This code was used to select the stroke dataset
str(Stroke)                                     # the str function was used to check the function of the dataset
# there are 12 variables  and 5110 observations in the dataset
#variables that are intergers are id, hypertension, heart disease and stroke. 
#numeric variables are age and average glucose level
#variables that are characters are gender, marriage status, work type, bmi and smoking status.
#Data Cleaning
anyNA(Stroke)
Stroke <- Stroke[,2:12]   #Removing patient ID
Stroke$gender <- as.factor(Stroke$gender)   #changing gender to a factor
Stroke$ever_married <- as.factor(Stroke$ever_married)   #changing marriage status to a factor
Stroke$Residence_type <- as.factor(Stroke$Residence_type)   #changing Residence type to a factor
Stroke$work_type <- as.factor(Stroke$work_type)   #changing work type to a factor
Stroke$smoking_status <- as.factor(Stroke$smoking_status)   #changing smoking status to a factor
Stroke$stroke <- as.factor(Stroke$stroke)   #changing stroke to a factor
Stroke$hypertension <- as.factor(Stroke$hypertension)   #changing hypertension to a factor
Stroke$heart_disease <- as.factor(Stroke$heart_disease)   #changing heart disease to a factor
Stroke$bmi <- as.numeric(Stroke$bmi)   #changing bmi to numeric
str(Stroke)
anyNA(stroke)   #there are empty rows in the data
Stroke <- n

#splitting data into training and testing
intrain <- createDataPartition(y = stroke$stroke, p = 0.7, list = FALSE)
training <- stroke[intrain,]
testing <- stroke[-intrain,]
dim(training)
dim(testing)
summary(stroke)

#Training the data
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
library("e1071")
svm_Linear <- train(stroke$stroke ~., data = training, method = "svmLinear",trControl = trctrl, preProcess = c("center", "scale"), tuneLength = 10)
