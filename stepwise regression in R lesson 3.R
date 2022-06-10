# stepwise regression forward backward and hybrid elimination
head(mtcars)

#create a function called Fitall to create a model of all the predictor variables
FitAll =lm(mpg~., data= mtcars)
summary(FitAll)
#then do the backwards elimination
step(FitAll, direction = 'backward')
#then copy and paste the results from 'call' and make a new model with the results
fitsome =lm(formula = mpg ~ wt + qsec + am, data = mtcars)
summary(fitsome)

#forward regression substitute the . for all to a 1 for none after the ~
fitstart = lm(mpg ~ 1, data = mtcars)
summary(fitstart)

# start the regression first by listing all the variables
# or copy the code from the backward selection
step(fitstart, direction = 'forward', scope = (~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb))

step(fitstart, direction = 'forward', scope = (formula(FitAll)))

# make the final model with the new variables in
fitsome2 = lm(mpg ~ wt + cyl + hp, data = mtcars)
summary(fitsome2)


# hybrid selection with forward and backward
step(fitstart, direction="both", scope=formula(FitAll))
#no model needed with hybrid


