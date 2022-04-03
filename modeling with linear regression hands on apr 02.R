library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("e1071")
library("lmtest")

#testing for linearity
#create a scatterplot to see where the data lies

scatter.smooth(x=heights$AM_Height, y=heights$PM_Height, main="heights")

# test for homoscedasticity by creating the linear model bp test

htsMod <- lm(PM_Height~AM_Height, data=heights)
par(mfrow=c(2,2))
plot(htsMod)

#Breush-Pagan test- another test since the two left plots have slight upward trends
lmtest::bptest(htsMod)

#box cox transformation to correct homoscedasticity violation

distBCMod1 <- caret::BoxCoxTrans(heights$PM_Height)
print(distBCMod1)

#bind it to the current dataset

heights <- cbind(heights, dist_newM=predict(distBCMod1, heights$PM_Height))

lmMod_bc2 <- lm(dist_newM~AM_Height, data=heights)
lmtest::bptest(lmMod_bc2)


# testing for outliers must test for all three at once distance leverage influential
#first test for outliers in x space with a cook's distance test(predictmeans library)


CookD(lmMod_bc2, group=NULL, plot=TRUE, idn=3, newwd=TRUE)
