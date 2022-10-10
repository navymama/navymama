Name <- c("Bob", "Nancy", "Cyrus", "Jackie")
Age <- c(36,31,26,34)
Dominant_Hand <- c("Right", "Right", "Left", "Right")
friends <- data.frame(Name, Age, Dominant_Hand)
friends
friends$Age
friends$Name
friends$Dominant_Hand
friends[3,2]
View(friends)
friends$Shoe_Size <- c(10,8,14,9)
View(friends)
head(mtcars)
tail(mtcars)
help(mtcars)

read.csv("Pets")
my_pets <- read.csv("PetsCSV.csv") 
library(readxl)
my_petsExcel <- read_excel("Pets.xlsx")

View(student.mat)

install.packages("readxl")
library(readxl)
my_petsExcel <- read_excel("Pets.xlsx")


help("install.packages")
install.packages(("Tidyverse"))
install.packages(("reprex"))

install.packages("dplyr")
library("dplyr")
head("student.mat")
View("student.mat")

library(datasets)


View(student.math)

library("dplyr")


library(datasets)
View(student.mat)




#get all observations(rows) that contain goats

filter(my_pets, Animal=="Goat")
filter(my_pets, Animal=="Goat", Age<=2)
filter(my_pets, Weight > 3)
filter(my_pets, Animal %in% c("Goat", "Cat", "Guinea Pig"))
filter(my_pets, Animal != "Gold Fish") 

View(mtcars)


filter(mtcars, cyl==4)

filter(mtcars, hp< 100)

summarise(mtcars, median.mpg= median(mpg))


summarise((median.mpg =median(mpg)) %>% group_by (cyl) %>% mtcars
summarise((mtcars, median.mpg = median
           
arrange(my_pets, Age)
arrange(my_pets, desc(Age))
mammals <- filter(my_pets, Animal != "Gold Fish")
 arrange(mammals, Age) 
 my_pets %>% filter(Animal != "Gold Fish") %>% arrange(Age)
 
 arrange(mtcars, hp)
 select(my_pets, Name, Animal)
 mutate(my_pets, Weight_kg = Weight/2.20462)
 mutate(my_pets, Status = "Alive")
 select(mtcars, hp, cyl)
 
 summarize(my_pets, ave_age = mean(Age))
 my_pets %>% group_by(Animal) %>% summarize(ave.age = mean(Age))
 
 my_pets %>% group_by(Animal) %>% summarize(count = n())
 my_pets %>% group_by(Name, Animal) %>% summarize(count = n())
 
 
 head(morley)
View(morley)                  
ggplot(morley, aes(x = Expt, y = Speed)) + geom_boxplot(aes(group=Expt))
install.packages(("ggplot2")
morley %>% group_by(Expt) %>% summarize(m.speed = mean(Speed))
ggplot(stress_relief, aes(x = MeditationYN, y = BloodPressure)) + geom_boxplot(aes(group=MeditationYN))
ggplot(stress_relief, aes(x = MeditationYN, y = BloodPressure)) + geom_boxplot(aes(group=MeditationYN))
library(stress_relief)
library(stress)

