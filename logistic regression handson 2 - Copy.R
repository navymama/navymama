# logistic regression 
library("caret")
library("IDPmisc")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("e1071")
library("popbio")
library("ggplot2")

# no wrangling done columns are already recoded
# test for assumptions
#create the logistic regression model

str(minerals)

AUlogit <- glm(Gold ~ ï..Antimony, data=minerals, family="binomial")

# predict function
probabilities <- predict(AUlogit, type = "response")
probabilities <- predict(AUlogit, type = "response")
minerals$Predicted <- ifelse(probabilities > .5, "pos", "neg")
#recode the predicted variable now

minerals$PredictedR <- NA
minerals$PredictedR[minerals$Predicted=='pos'] <- 1
minerals$PredictedR[minerals$Predicted=='neg'] <- 0
#convert variables to factors

minerals$PredictedR <- as.factor(minerals$PredictedR)
minerals$Gold <- as.factor(minerals$Gold)

#make a confusion matrix

conf_mat <- caret::confusionMatrix(minerals$PredictedR, minerals$Gold)
conf_mat

# 34 cases was predicted to not find gold and none was found
# 8 cases were predicted to not find gold and gold was found
# 2 cases were predicted to find gold and none was found
# 20 cases were predicted to find gold and gold was found
# sample size assumption was not med but 84% of the time if antimony is found
#there is gold

#logit linearity

minerals1 <- minerals %>% 
  dplyr::select_if(is.numeric)

predictors <- colnames(minerals1)

predictors <- colnames(minerals1)
minerals1 <- minerals1 %>%
  mutate(logit=log(probabilities/(1-probabilities))) %>%
  gather(key= "predictors", value="predictor.value", -logit)

#then make a graph

ggplot(minerals1, aes(logit, predictor.value))+
  geom_point(size=.5, alpha=.5)+
  geom_smooth(method= "loess")+
  theme_bw()+
  facet_wrap(~predictors, scales="free_y") 


# multiconninearity test skipped
# independent errors

summary(AUlogit)
plot(AUlogit$residuals)

#assumption of independent errors has been met
#durbin watson test

dwtest(AUlogit, alternative="two.sided")

# screen for outliers

infl <- influence.measures(AUlogit)
summary(infl)

# no significant outliers




