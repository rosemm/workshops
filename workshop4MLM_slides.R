## ----setup, include=FALSE, echo=FALSE------------------------------------
library("knitr")
opts_chunk$set(fig.align='center',fig.show='hold',size='footnotesize', eval=TRUE)

## ------------------------------------------------------------------------
install.packages("ggplot2")
install.packages("haven")
install.packages("dplyr")
install.packages("tidyr")

library("ggplot2")
library("haven")
library("dplyr")
library("tidyr")

## ----install_lme4--------------------------------------------------------
install.packages("lme4")
library("lme4")

## ------------------------------------------------------------------------
help(package="lme4")

## ----getwd---------------------------------------------------------------
getwd()

## ----data----------------------------------------------------------------
atlas <- read_sav("data/ATLAS.sav")

## ------------------------------------------------------------------------
?gather

## ------------------------------------------------------------------------
str(atlas)

## ------------------------------------------------------------------------
atlas$schoolid <- as.factor(atlas$schoolid)

atlas$intervention <- factor(atlas$intervention, 
                             levels=c(0,1),
                             labels=c("no", "yes"))

## ----scale---------------------------------------------------------------
atlas$STSE0c <- atlas$STSE0 - mean(atlas$STSE0, na.rm=TRUE)

## ----lm------------------------------------------------------------------
lm(STSE1 ~ intervention * STSE0c, data=atlas,
   na.action = na.exclude)

## ------------------------------------------------------------------------
model0 <- lmer(STSE1 ~ 1 + 
                 (1|schoolid), 
              data = atlas,
              na.action = na.exclude)

# the variance components
varcom <- as.data.frame(VarCorr(model0))

## ----icc-----------------------------------------------------------------
L2var <- varcom$vcov[1]
L1var <- varcom$vcov[2]

icc <- L2var/(L2var+L1var)

## ------------------------------------------------------------------------
model1 <- lmer(STSE1 ~ intervention * STSE0c + 
                 (1|schoolid), 
              data = atlas,
              na.action = na.exclude)

## ------------------------------------------------------------------------
summary(model1)

## ------------------------------------------------------------------------
library(lmerTest)

model1 <- lmer(STSE1 ~ intervention * STSE0c + 
                 (1|schoolid), 
              data = atlas,
              na.action = na.exclude)

summary(model1)

## ------------------------------------------------------------------------
model2 <- lmer(STSE1 ~ intervention * STSE0c + 
                 (1 + STSE0c|schoolid), 
              data = atlas,
              na.action = na.exclude)

summary(model2)

## ------------------------------------------------------------------------
model2.nocov <- lmer(STSE1 ~ intervention * STSE0c + 
                 (1|schoolid) + (0 + STSE0c|schoolid), 
              data = atlas,
              na.action = na.exclude)

summary(model2.nocov)

## ------------------------------------------------------------------------
anova(model1, model2)

## ------------------------------------------------------------------------
model3 <- lmer(STSE1 ~ intervention * STSE0c + 
                 (1 + intervention * STSE0c | schoolid), 
              data = atlas,
              na.action = na.exclude)

## ----texreg--------------------------------------------------------------
htmlreg(model2, file="model2_table.doc") # one model

htmlreg(list(model1, model2), file="model1and2_table.doc") # compare two or more models

## ----predict-------------------------------------------------------------
atlas$pred1 <- predict(model1)

atlas$pred2 <- predict(model2)

## ----geom_point----------------------------------------------------------
ggplot(atlas, aes(y=STSE1, x=STSE0c, color=intervention)) + 
  geom_point(alpha=.3)

## ------------------------------------------------------------------------
ggplot(atlas, aes(y=STSE1, x=STSE0c, color=intervention, group=schoolid)) + 
  geom_point(alpha=.3) + 
  geom_smooth(method="lm", se=FALSE)

## ------------------------------------------------------------------------
ggplot(atlas, aes(y=STSE1, x=STSE0c, color=intervention)) + 
  geom_point(alpha=.3) + 
  geom_line(aes(y=pred1, group=schoolid), alpha=.7) + 
  labs(title="Model 1: Random Intercepts")

## ------------------------------------------------------------------------
ggplot(atlas, aes(y=STSE1, x=STSE0c, color=intervention)) + 
  geom_point(alpha=.3) + 
  geom_line(aes(y=pred2, group=schoolid), alpha=.7) + 
  labs(title="Model 2: Random Slopes of STSE0 and Intercepts") 

