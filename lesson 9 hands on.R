library(ggplot2)
library(dplyr)
library(gapminder)
dataset(gapminder)

#see the countries
levels(gapminder$country)
 
#find all the years in the dataset
unique(gapminder$year)

#which country of the five has the lowest per capita GDP in 1952? 2007?

Countries <- gapminder %>% filter (country %in% c("Belgium", "Austria", "Egypt","Australia", "Switzerland"))
View(Countries)

filter(Countries, year %in% c(1952, 2007)) %>% arrange(gdpPercap)

#which has the highest per capita GDP in 1952? 2007?

filter(Countries, year %in% c(1952, 2007)) %>% arrange (desc(gdpPercap, year))

#create a line plot with year on the horizontal axis(x) and lifeExp on the vertical axis(y) for the five countries; give each country a different color line.
                                                        
ggplot(Countries) + geom_line(aes(x = year, y = lifeExp, color = country)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in Five Countries")

#on the entire gapminder data frame compute the median of lifeExp for each year. for what years is the life expectancy of your five countries above the median life expectancy for the entire gapminder data frame?

median <- gapminder %>% select (year, lifeExp, country ) %>% group_by(year,) %>% summarise(medlifeExp= median(lifeExp))
View(median)
