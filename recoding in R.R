library("tidyr")
#recode activity into junkfood
Eating_Habits$JunkFoodR <- NA
Eating_Habits$JunkFoodR[Activity]

library("ggplot2")
library("lattice")

#makng a bar chart
ggplot(HR_data, aes(salary))+
  geom_bar()+
  ggtitle("Frequency of Salary")+
  xlab("Salary Category")+
  ylab("Frequency")

#bar chart with lattice
barchart(HR_data$salary)
#adding labels and a title with lattice

barchart(HR_data$salary, main="Frequency of Salary", ylab="Salary Category,", xlab="Frequency", col="green")
#stacked bar charts

ggplot(data=HR_data)+
  geom_bar(mapping= aes(x=sales, fill=salary))+
  ggtitle("Sales Categories by Salary Level")+
  xlab("Sales Category")+
  ylab("Frequency")

#make bar heights the same with 'position & fill' argument
ggplot(data=HR_data)+
  geom_bar(mapping = aes(x=sales, fill=salary), position="fill")+
  ggtitle("Sales Categories by Salary Level")+
  xlab("Sales Category")+
  ylab("Frequency")

#use 'dodge' function to change stacks to side by side
ggplot(data=HR_data)+
  geom_bar(mapping = aes(x=sales, fill=salary), position="dodge")+
  ggtitle("Sales Categories by Salary Level")+
  xlab("Sales Category")+
  ylab("Frequency")

#line charts
#determine the data type with 'str' function

str(earthquakes)
#correct "M" to numeric with 'as.numeric' function

earthquakes$M <- as.numeric(earthquakes$M)
str(earthquakes)

ggplot(earthquakes, aes(as.Date(Date, "%j-%b-%y"), M))+
  geom_line()+
  xlab("Date of Earthquake")+
  ylab("Earthquake Magnitude")+
  ggtitle("Magnitude of Earthquakes over Time")
rlang::last_error()


