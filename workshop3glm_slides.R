### R code from vignette source 'workshop3glm_slides.Rnw'

###################################################
### code chunk number 2: workshop3glm_slides.Rnw:115-120
###################################################
install.packages("ggplot2")
install.packages("dplyr")

library("ggplot2")
library("dplyr")


###################################################
### code chunk number 3: workshop3glm_slides.Rnw:176-178
###################################################
install.packages("knitr")
library("knitr")


###################################################
### code chunk number 4: workshop3glm_slides.Rnw:202-203
###################################################
install.packages("pander")


###################################################
### code chunk number 5: getwd
###################################################
getwd()


###################################################
### code chunk number 6: workshop3glm_slides.Rnw:248-249
###################################################
osf <- read.csv("data/OSF_badges.csv")


###################################################
### code chunk number 7: workshop3glm_slides.Rnw:261-264
###################################################
str(osf)
head(osf)
summary(osf)


###################################################
### code chunk number 8: workshop3glm_slides.Rnw:267-269
###################################################
osf$date <- as.Date(osf$date)
str(osf)


###################################################
### code chunk number 9: workshop3glm_slides.Rnw:282-283
###################################################
?na.omit


###################################################
### code chunk number 10: workshop3glm_slides.Rnw:287-293
###################################################
osf.lgt <- osf %>% 
  select(statement.included, date, Journal) %>% 
  filter(Journal != "Infant behavior & development") %>% 
  na.omit()

summary(osf.lgt)


###################################################
### code chunk number 11: workshop3glm_slides.Rnw:314-315
###################################################
?glm


###################################################
### code chunk number 12: workshop3glm_slides.Rnw:330-333
###################################################
glm(statement.included ~ date, data=osf.lgt,
     family=binomial(link="logit"),
     na.action=na.exclude)


###################################################
### code chunk number 13: links
###################################################
?binomial


###################################################
### code chunk number 14: model
###################################################
logit.model1 <- glm(statement.included ~ date, data=osf.lgt,
                   family=binomial(link="logit"),
                   na.action=na.exclude)


###################################################
### code chunk number 15: workshop3glm_slides.Rnw:366-369
###################################################
logit.model1

str(logit.model1)


###################################################
### code chunk number 16: workshop3glm_slides.Rnw:390-391
###################################################
summary(logit.model1)


###################################################
### code chunk number 17: workshop3glm_slides.Rnw:397-398
###################################################
levels(osf.lgt$statement.included)


###################################################
### code chunk number 18: workshop3glm_slides.Rnw:407-409
###################################################
model.sum <- summary(logit.model1)
pander(model.sum)


###################################################
### code chunk number 19: workshop3glm_slides.Rnw:421-424
###################################################
logit.model0 <- glm(statement.included ~ 1, data=osf.lgt,
                    family=binomial(link="logit"),
                    na.action=na.exclude)


###################################################
### code chunk number 20: workshop3glm_slides.Rnw:429-430
###################################################
anova(logit.model0, logit.model1, test="Chisq") 


###################################################
### code chunk number 21: predict
###################################################
osf.lgt$pred1 <- predict(logit.model1, 
                                osf.lgt, 
                                type="response") 

osf.lgt$pred0 <- predict(logit.model0, 
                                 osf.lgt, 
                                 type="response") 


###################################################
### code chunk number 22: clas
###################################################
osf.lgt$clas0 <- ifelse(osf.lgt$pred0 >= .5, 1,
                                ifelse(osf.lgt$pred0 < .5, 0, 
                                       NA))
osf.lgt$clas1 <- ifelse(osf.lgt$pred1 >= .5, 1,
                                ifelse(osf.lgt$pred1 < .5, 0, 
                                       NA))


###################################################
### code chunk number 23: clas_factor
###################################################
osf.lgt$clas0 <- factor(osf.lgt$clas0,
                                levels=c(1,0),
                                labels=c("yes", "no"))
osf.lgt$clas1 <- factor(osf.lgt$clas1,
                                levels=c(1,0),
                                labels=c("yes", "no"))


###################################################
### code chunk number 24: crosstabs
###################################################
xtabs(~ statement.included + clas0, data=osf.lgt)

xtabs(~ statement.included + clas1, data=osf.lgt)


###################################################
### code chunk number 25: workshop3glm_slides.Rnw:510-512
###################################################
ggplot(osf.lgt, aes(x=date, y=statement.included)) + 
  geom_point(alpha=.3)


###################################################
### code chunk number 26: plot_predict
###################################################
ggplot(osf.lgt, aes(x=date, y=as.numeric(statement.included)-1)) + 
  geom_point( alpha=.3 ) + 
  geom_line( aes(y=pred, x=date) ) +
  labs(y="Probability of providing a data statement")


###################################################
### code chunk number 27: model2
###################################################
logit.model2 <- glm(statement.included ~ date*Journal, data=osf.lgt,
                   family=binomial(link="logit"),
                   na.action=na.exclude)


###################################################
### code chunk number 28: workshop3glm_slides.Rnw:560-561
###################################################
anova(logit.model0, logit.model1, logit.model2, test="Chisq") 


###################################################
### code chunk number 29: workshop3glm_slides.Rnw:568-579
###################################################
osf.lgt$pred2 <- predict(logit.model2, 
                                osf.lgt, 
                                type="response") 
osf.lgt$clas2 <- ifelse(osf.lgt$pred2 >= .5, 1,
                                ifelse(osf.lgt$pred2 < .5, 0, 
                                       NA))
osf.lgt$clas2 <- factor(osf.lgt$clas2,
                                levels=c(1,0),
                                labels=c("yes", "no"))

xtabs(~ statement.included + clas2, data=osf.lgt)


###################################################
### code chunk number 30: plot_predict2
###################################################
ggplot(osf.lgt, aes(x=date, y=as.numeric(statement.included)-1, 
                    color=Journal)) + 
  geom_point( alpha=.3 ) + 
  geom_line( aes(y=pred2, x=date) ) +
  labs(y="Probability of providing a data statement")


###################################################
### code chunk number 31: workshop3glm_slides.Rnw:604-607
###################################################
summary(osf$Number.of.experiments)

hist(osf$Number.of.experiments)


###################################################
### code chunk number 32: workshop3glm_slides.Rnw:612-616
###################################################
osf.pois <- osf %>% 
  select(Number.of.experiments, Journal) %>% 
  filter(Journal != "Infant behavior & development") %>% 
  na.omit()


###################################################
### code chunk number 33: pos_model
###################################################
pois.model <- glm(Number.of.experiments ~ Journal, data=osf.pois,
                   family=poisson(link = "log"),
                   na.action=na.exclude)  


###################################################
### code chunk number 34: workshop3glm_slides.Rnw:638-640
###################################################
ggplot(osf.pois, aes(x=Number.of.experiments)) + 
  geom_histogram() 


###################################################
### code chunk number 35: workshop3glm_slides.Rnw:644-649
###################################################
ggplot(osf.pois, aes(x=Number.of.experiments, fill=Journal)) + 
  geom_histogram()

ggplot(osf.pois, aes(x=Number.of.experiments, fill=Journal)) + 
  geom_density(alpha=.3, adjust=2) 


