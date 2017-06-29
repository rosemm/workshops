### R code from vignette source 'workshop2lm_slides.Rnw'

###################################################
### code chunk number 1: setup
###################################################
library("knitr")
opts_chunk$set(fig.align='center',fig.show='hold',size='footnotesize', eval=TRUE)


###################################################
### code chunk number 2: workshop2lm_slides.Rnw:114-119
###################################################
install.packages("ggplot2")
install.packages("haven")

library("ggplot2")
library("haven")


###################################################
### code chunk number 3: workshop2lm_slides.Rnw:188-190
###################################################
install.packages("knitr")
library("knitr")


###################################################
### code chunk number 4: workshop2lm_slides.Rnw:216-217
###################################################
install.packages("pander")


###################################################
### code chunk number 5: getwd
###################################################
getwd()


###################################################
### code chunk number 6: workshop2lm_slides.Rnw:262-263
###################################################
atlas <- read_sav("data/ATLAS.sav")


###################################################
### code chunk number 7: workshop2lm_slides.Rnw:275-278
###################################################
str(atlas)
head(atlas)
summary(atlas)


###################################################
### code chunk number 8: make_factor
###################################################
atlas$use0 <- factor(atlas$use0, 
                     levels=c(0, 1),
                     labels=c("no", "yes")) 

atlas$intervention <- factor(atlas$intervention, 
                             levels=c(0, 1),
                             labels=c("no", "yes")) 

summary(atlas)


###################################################
### code chunk number 9: workshop2lm_slides.Rnw:318-319
###################################################
?lm


###################################################
### code chunk number 10: ex1_model
###################################################
model1 <- lm( STSE1 ~ STSE0 + intervention, data=atlas,
              na.action=na.exclude)


###################################################
### code chunk number 11: workshop2lm_slides.Rnw:344-346
###################################################
lm( STSE1 ~ SE1, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 12: workshop2lm_slides.Rnw:356-358
###################################################
lm( STSE1 ~ intervention, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 13: workshop2lm_slides.Rnw:367-369
###################################################
lm( STSE1 ~ intervention + SE1 + STSE0, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 14: workshop2lm_slides.Rnw:381-383
###################################################
lm( STSE1 ~ intervention + SE1 + STSE0 + SE1:STSE0, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 15: workshop2lm_slides.Rnw:386-388
###################################################
lm( STSE1 ~ intervention + SE1*STSE0, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 16: workshop2lm_slides.Rnw:398-400
###################################################
lm( STSE1 ~ intervention + STSE0 + intervention:STSE0, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 17: workshop2lm_slides.Rnw:403-405
###################################################
lm( STSE1 ~ intervention*STSE0, data=atlas,
    na.action=na.exclude)


###################################################
### code chunk number 18: workshop2lm_slides.Rnw:414-416
###################################################
model1 <- lm( STSE1 ~ intervention*STSE0, data=atlas,
              na.action=na.exclude)


###################################################
### code chunk number 19: workshop2lm_slides.Rnw:426-431
###################################################
model1

str(model1)

plot(model1)


###################################################
### code chunk number 20: workshop2lm_slides.Rnw:452-453
###################################################
summary(model1)


###################################################
### code chunk number 21: workshop2lm_slides.Rnw:462-464
###################################################
model.sum <- summary(model1)
pander(model.sum)


###################################################
### code chunk number 22: workshop2lm_slides.Rnw:476-477
###################################################
car::Anova(model1, type=3) # type 3 sums of squares


###################################################
### code chunk number 23: workshop2lm_slides.Rnw:500-502
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1)) + 
  geom_point()


###################################################
### code chunk number 24: workshop2lm_slides.Rnw:507-509
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1)) + 
  geom_point(alpha=.3)


###################################################
### code chunk number 25: workshop2lm_slides.Rnw:518-520
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1, color=intervention)) + 
  geom_point(alpha=.3)


###################################################
### code chunk number 26: workshop2lm_slides.Rnw:525-528
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1)) + 
  geom_point(alpha=.3) + 
  facet_wrap(~ intervention)


###################################################
### code chunk number 27: relabel_factor
###################################################
atlas$intervention <- factor(atlas$intervention,
                             levels=c("yes", "no"),
                             labels=c("intervention", "control"))


###################################################
### code chunk number 28: workshop2lm_slides.Rnw:551-555
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1, 
                  color=intervention, fill=intervention)) + 
  geom_point(alpha=.3) + 
  geom_smooth(method="lm")


###################################################
### code chunk number 29: workshop2lm_slides.Rnw:560-564
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1)) + 
  geom_point(alpha=.3) + 
  geom_smooth(method="lm") + 
  facet_wrap(~ intervention)


###################################################
### code chunk number 30: final_plot
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1, 
                  color=intervention, fill=intervention)) + 
  geom_point(alpha=.3) + 
  geom_smooth(method="lm") + 
  labs(x="pretest strength training self-efficacy",
       y="posttest strength training self-efficacy")


###################################################
### code chunk number 31: predict
###################################################
atlas$pred <- predict(model1, atlas)


###################################################
### code chunk number 32: plot_predict
###################################################
ggplot(atlas, aes(x=STSE0, y=STSE1, 
                  color=intervention, fill=intervention)) + 
  geom_point(alpha=.3) + 
  geom_line(aes(y=pred, x=STSE0, color=intervention)) + 
  labs(x="pretest strength training self-efficacy",
       y="posttest strength training self-efficacy")


###################################################
### code chunk number 33: workshop2lm_slides.Rnw:622-623
###################################################
?t.test


###################################################
### code chunk number 34: workshop2lm_slides.Rnw:627-630
###################################################
install.packages("car")
library("car")
?Anova


###################################################
### code chunk number 35: workshop2lm_slides.Rnw:641-643
###################################################
t.test(STSE0 ~ intervention, data=atlas, 
       var.equal=TRUE)


###################################################
### code chunk number 36: workshop2lm_slides.Rnw:648-650
###################################################
t.test(STSE0 ~ intervention, data=atlas, 
       var.equal=FALSE)


###################################################
### code chunk number 37: workshop2lm_slides.Rnw:655-656
###################################################
summary(atlas$intervention)


###################################################
### code chunk number 38: workshop2lm_slides.Rnw:666-668
###################################################
t.test(SE0 ~ intervention, data=atlas, 
       var.equal=TRUE)


###################################################
### code chunk number 39: workshop2lm_slides.Rnw:680-681
###################################################
t.test(x=atlas$STSE0) # can't use formula and data argument for one-sample t-tests


###################################################
### code chunk number 40: workshop2lm_slides.Rnw:692-694
###################################################
t.test(x=atlas$STSE0, y=atlas$STSE1,
       paired=TRUE) 


###################################################
### code chunk number 41: workshop2lm_slides.Rnw:704-707
###################################################
model <- lm(STSE0 ~ intervention, data=atlas)

car::Anova(model, type=3) # type 3 sums of squares


