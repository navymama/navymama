library("ggplot2")

#check for quadratic relationship with a graph

quadPlot <- ggplot(bluegill_fish, aes(x = age, y=length)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot

# square the x term(age) save it as its own variable
Agesq <- bluegill_fish$age^2

#make the quadratic model
quadModel <- lm(bluegill_fish$length~bluegill_fish$age+Agesq)
summary(quadModel)

# exponential modeling lm function and log function
exMod <- lm(log(bacteria$Count)~bacteria$Period)
summary(exMod)
