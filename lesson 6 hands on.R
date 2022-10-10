#create a boxplot of miles per gallon grouped by the number of cylinders in the engine
ggplot(mtcars, aes(x=mpg, y=cyl))+geom_boxplot (aes(group= cyl))
mtcars %>% group_by(cyl) %>% summarize(count = n())
