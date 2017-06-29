### R code from vignette source 'workshop1_slides.Rnw'

###################################################
### code chunk number 3: workshop1_slides.Rnw:227-230
###################################################
3 + 4
112/2
sqrt(5)


###################################################
### code chunk number 4: workshop1_slides.Rnw:240-246
###################################################
sum(3, 4)
log(1/2)
sin(0)
sin(1)
sin(pi)
?log


###################################################
### code chunk number 5: workshop1_slides.Rnw:256-258
###################################################
x <- 3
x


###################################################
### code chunk number 6: workshop1_slides.Rnw:265-267
###################################################
x + 4
y <- 4


###################################################
### code chunk number 7: workshop1_slides.Rnw:270-271
###################################################
rm(x)


###################################################
### code chunk number 8: workshop1_slides.Rnw:275-276
###################################################
x <- 3


###################################################
### code chunk number 9: workshop1_slides.Rnw:300-301
###################################################
x + y


###################################################
### code chunk number 10: workshop1_slides.Rnw:305-306
###################################################
x <- 1


###################################################
### code chunk number 11: workshop1_slides.Rnw:317-322
###################################################
variablex<- 3
variablex<-3
variablex <-
  3
variable x <- 3


###################################################
### code chunk number 12: workshop1_slides.Rnw:333-335
###################################################
sqrt_5 <- sqrt(5)
pi <- sqrt(5)


###################################################
### code chunk number 13: workshop1_slides.Rnw:340-341
###################################################
favorite_phrase <- "woo hooo!"


###################################################
### code chunk number 14: workshop1_slides.Rnw:392-393
###################################################
x <- 1:10


###################################################
### code chunk number 15: workshop1_slides.Rnw:397-398
###################################################
x + 4


###################################################
### code chunk number 16: workshop1_slides.Rnw:407-409
###################################################
x <- c(1,2,10)
y <- c(3,5,7)


###################################################
### code chunk number 17: workshop1_slides.Rnw:412-413
###################################################
x + y


###################################################
### code chunk number 18: workshop1_slides.Rnw:421-422
###################################################
seq(from=1, to=10, by=1)


###################################################
### code chunk number 19: workshop1_slides.Rnw:425-426
###################################################
seq(from=1, to=10, by=2)


###################################################
### code chunk number 20: workshop1_slides.Rnw:436-438
###################################################
seq(1, 10, by=1)
seq(1, 10)


###################################################
### code chunk number 21: workshop1_slides.Rnw:443-445
###################################################
seq(10, 1)
seq(5)


###################################################
### code chunk number 22: workshop1_slides.Rnw:457-458
###################################################
?seq


###################################################
### code chunk number 23: workshop1_slides.Rnw:470-471
###################################################
seq(from=10, to=50, by=10)


###################################################
### code chunk number 24: workshop1_slides.Rnw:480-481
###################################################
rep(3, times=1)


###################################################
### code chunk number 25: workshop1_slides.Rnw:485-487
###################################################
rep(favorite_phrase, 3)
c(favorite_phrase, 1:5)


###################################################
### code chunk number 26: workshop1_slides.Rnw:490-492
###################################################
x <- c(favorite_phrase, 1:5)
mode(x)


###################################################
### code chunk number 27: workshop1_slides.Rnw:503-508
###################################################
c(10, 10, 20, 20, 30, 30)
c(10, 20, 30, 10, 20, 30)
rep(seq(10, 30, by=10), times=2)
rep(seq(10, 30, by=10), each=2)
sort(rep(seq(10, 30, by=10), 2))


###################################################
### code chunk number 28: workshop1_slides.Rnw:530-531
###################################################
log(seq(from=0, to=10, length.out=100))


###################################################
### code chunk number 29: workshop1_slides.Rnw:540-542
###################################################
cor(x,y)
plot(y ~ x)


###################################################
### code chunk number 30: workshop1_slides.Rnw:546-547
###################################################
plot(x ~ y)


###################################################
### code chunk number 31: workshop1_slides.Rnw:556-557
###################################################
rnorm(10)


###################################################
### code chunk number 32: workshop1_slides.Rnw:563-564
###################################################
rnorm(1, mean=100, sd=15)


###################################################
### code chunk number 33: workshop1_slides.Rnw:573-574
###################################################
hist(rnorm(100, mean=50, sd=5))


###################################################
### code chunk number 34: workshop1_slides.Rnw:589-591
###################################################
x <- seq(from=-5, to=5, by=.1)
plot(sin(x) ~ x)


###################################################
### code chunk number 35: workshop1_slides.Rnw:604-606
###################################################
plot(rnorm(100) ~ rnorm(100), xlab="Predictor", ylab="Outcome", 
     main="My lovely null results")


###################################################
### code chunk number 36: workshop1_slides.Rnw:626-629
###################################################
x <- data.frame(id=1:10, scores = rnorm(10))
x
str(x)


###################################################
### code chunk number 37: workshop1_slides.Rnw:633-636
###################################################
head(x)
tail(x)
View(x)


###################################################
### code chunk number 38: workshop1_slides.Rnw:645-647
###################################################
conditions <- rep(c("condition 1", "condition 2", "condition 3"), 
                  each=5)


###################################################
### code chunk number 39: workshop1_slides.Rnw:652-653
###################################################
scores <- runif(15, min=1, max=10)


###################################################
### code chunk number 40: workshop1_slides.Rnw:663-665
###################################################
my_data <- data.frame(conditions, scores)
str(my_data)


###################################################
### code chunk number 41: workshop1_slides.Rnw:670-671
###################################################
my_data$scores


###################################################
### code chunk number 42: workshop1_slides.Rnw:708-713
###################################################
head(iris)
str(iris)
data()
colnames(iris)
summary(iris)


###################################################
### code chunk number 43: workshop1_slides.Rnw:737-739
###################################################
plot(scores ~ conditions, data=my_data, xlab=NULL, 
     main="Some made-up data")


###################################################
### code chunk number 44: workshop1_slides.Rnw:747-749
###################################################
plot(scores ~ conditions, data=my_data, xlab=NULL, 
     main="Some made-up data")


###################################################
### code chunk number 45: workshop1_slides.Rnw:771-772
###################################################
install.packages("haven")


###################################################
### code chunk number 46: workshop1_slides.Rnw:777-778
###################################################
library("haven")


###################################################
### code chunk number 47: workshop1_slides.Rnw:786-787
###################################################
help(package="haven")


###################################################
### code chunk number 48: workshop1_slides.Rnw:796-797
###################################################
?read_sav


###################################################
### code chunk number 49: workshop1_slides.Rnw:843-846
###################################################
surveydata <- read_sav("Workshop_Sign_up_Spring2016.sav")
surveydata <- dplyr::select(surveydata, Q5_10:Q5_13, Q4, Q8:Q9_3_TEXT)
write_sav(surveydata, "survey.sav")


###################################################
### code chunk number 50: read_sav
###################################################
atlas <- read_sav("ATLAS.sav")


###################################################
### code chunk number 51: getwd
###################################################
getwd()


###################################################
### code chunk number 52: setwd
###################################################
setwd("/Users/TARDIS/Desktop")


###################################################
### code chunk number 53: workshop1_slides.Rnw:887-888
###################################################
atlas <- read_sav("/Users/TARDIS/Desktop/ATLAS.sav")


###################################################
### code chunk number 54: workshop1_slides.Rnw:900-904
###################################################
atlas <- read_sav("data/ATLAS.sav")
head(atlas)
str(atlas)
summary(atlas)


###################################################
### code chunk number 55: workshop1_slides.Rnw:912-916
###################################################
osf <- read.csv("data/OSF_data.csv")
head(osf)
str(osf)
summary(osf)


###################################################
### code chunk number 56: workshop1_slides.Rnw:921-923
###################################################
osf$X <- NULL
str(osf)


###################################################
### code chunk number 57: workshop1_slides.Rnw:932-933
###################################################
corpus <- read.table("data/corpus.txt")


###################################################
### code chunk number 58: read.table
###################################################
corpus <- read.table("data/corpus.txt", 
                   header=TRUE, 
                   sep="\t", 
                   quote = NULL,
                   row.names = NULL,
                   stringsAsFactors = FALSE)


###################################################
### code chunk number 59: workshop1_slides.Rnw:947-948
###################################################
corpus <- read.delim("data/corpus.txt", stringsAsFactors = FALSE)


###################################################
### code chunk number 60: gapminder_data
###################################################
install.packages("gapminder")
library("gapminder")
help(package="gapminder")


###################################################
### code chunk number 61: workshop1_slides.Rnw:1009-1012
###################################################
head(gapminder)
str(gapminder)
summary(gapminder)


###################################################
### code chunk number 62: workshop1_slides.Rnw:1046-1050
###################################################
install.packages("dplyr", "tidyr")
library("dplyr")
library("tidyr")
help(package="dplyr")


###################################################
### code chunk number 63: workshop1_slides.Rnw:1061-1062
###################################################
?filter


###################################################
### code chunk number 64: workshop1_slides.Rnw:1065-1066
###################################################
gapminder.asia <- filter(gapminder, continent=="Asia")


###################################################
### code chunk number 65: workshop1_slides.Rnw:1077-1078
###################################################
filter(gapminder, lifeExp < mean(lifeExp))


###################################################
### code chunk number 66: workshop1_slides.Rnw:1090-1091
###################################################
filter(gapminder, lifeExp < mean(lifeExp) & continent == "Americas")


###################################################
### code chunk number 67: workshop1_slides.Rnw:1104-1105
###################################################
filter(gapminder, lifeExp < 40 | lifeExp > 75)


###################################################
### code chunk number 68: select
###################################################
select(gapminder, country, continent, year, lifeExp)


###################################################
### code chunk number 69: workshop1_slides.Rnw:1128-1134
###################################################
gapminder.lifeExp <- select(gapminder, 
                            country,  
                            year, 
                            lifeExp)
wide <- spread(gapminder.lifeExp, key=country, lifeExp)
wide


###################################################
### code chunk number 70: workshop1_slides.Rnw:1146-1151
###################################################
long <- gather(wide, 
               key="country", 
               value="lifeExp", 
               Afghanistan:Zimbabwe)
long


###################################################
### code chunk number 71: tidyr
###################################################
help(package="tidyr")


###################################################
### code chunk number 72: pipes
###################################################
gapminder %>% 
  select(country, year, lifeExp) %>% 
  spread(key=country, lifeExp)


###################################################
### code chunk number 73: workshop1_slides.Rnw:1183-1185
###################################################
gapminder %>% 
  group_by(country)


###################################################
### code chunk number 74: workshop1_slides.Rnw:1188-1191
###################################################
gapminder %>% 
  group_by(country) %>% 
  summarize(mean.pop=mean(pop))


###################################################
### code chunk number 75: group_by
###################################################
gapminder %>% 
  group_by(continent) %>% 
  summarize(min.gpd=min(gdpPercap), max.gpd=max(gdpPercap))


###################################################
### code chunk number 76: workshop1_slides.Rnw:1209-1211
###################################################
gapminder %>% 
  summarize(min.gpd=min(gdpPercap), max.gpd=max(gdpPercap))


###################################################
### code chunk number 77: workshop1_slides.Rnw:1220-1221
###################################################
?join


###################################################
### code chunk number 78: workshop1_slides.Rnw:1225-1230
###################################################
cont.means <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(cont.gdpPercap=mean(gdpPercap))
gapminder %>% 
  left_join(cont.means, by=c("continent", "year"))


###################################################
### code chunk number 79: workshop1_slides.Rnw:1242-1244
###################################################
gapminder %>% 
  mutate(pop.diff=pop - mean(pop), pop.sd=sd(pop), pop.Z=pop.diff/pop.sd)


###################################################
### code chunk number 80: workshop1_slides.Rnw:1266-1273
###################################################
cont.means <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(cont.pop=mean(pop))
  
gapminder %>% 
  left_join(cont.means, by=c("continent", "year")) %>% 
  mutate(diff.pop=pop-cont.pop)


###################################################
### code chunk number 81: workshop1_slides.Rnw:1283-1287
###################################################
gapminder %>% 
  filter(year >= 1997) %>% 
  group_by(continent) %>% 
  summarize(mean(lifeExp), mean(pop))


###################################################
### code chunk number 82: workshop1_slides.Rnw:1295-1301
###################################################
gapminder %>%
  filter(continent == "Asia") %>%
  select(year, country, lifeExp) %>%
  arrange(year) %>%
  group_by(year) %>%
  filter(min_rank(desc(lifeExp)) < 2 | min_rank(lifeExp) < 2)


###################################################
### code chunk number 83: workshop1_slides.Rnw:1308-1315
###################################################
gapminder %>%
  group_by(continent, country) %>%
  select(country, year, continent, lifeExp) %>%
  mutate(le_delta = lifeExp - lag(lifeExp)) %>%
  summarize(worst_le_delta = min(le_delta, na.rm = TRUE)) %>%
  filter(min_rank(worst_le_delta) < 2) %>%
  arrange(worst_le_delta)


###################################################
### code chunk number 84: ggplot2
###################################################
install.packages("ggplot2")
library("ggplot2")
?ggplot


###################################################
### code chunk number 85: workshop1_slides.Rnw:1357-1358
###################################################
ggplot(gapminder, aes(x=year, y=pop))


###################################################
### code chunk number 86: scatter
###################################################
ggplot(gapminder, aes(x=year, y=pop)) + 
  geom_point()


###################################################
### code chunk number 87: workshop1_slides.Rnw:1373-1375
###################################################
ggplot(gapminder, aes(x=year, y=pop)) + 
  geom_point(alpha=.3)


###################################################
### code chunk number 88: box
###################################################
ggplot(gapminder, aes(x=continent, y=lifeExp)) + 
  geom_boxplot()


###################################################
### code chunk number 89: hist
###################################################
ggplot(gapminder, aes(x=lifeExp)) + 
  geom_histogram()


###################################################
### code chunk number 90: boxplot
###################################################
ggplot(gapminder, aes(x=continent, y=lifeExp)) + 
  geom_bar()


###################################################
### code chunk number 91: workshop1_slides.Rnw:1416-1425
###################################################
plot.data <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean.lifeExp=mean(lifeExp), 
            sd=sd(lifeExp), 
            n=n(), 
            se=sd/sqrt(n))

ggplot(plot.data, aes(x=continent, y=mean.lifeExp)) + 
  geom_bar(stat="identity")


###################################################
### code chunk number 92: workshop1_slides.Rnw:1429-1433
###################################################
ggplot(plot.data, aes(x=continent, y=mean.lifeExp)) + 
  geom_bar(stat="identity") + 
  geom_errorbar(aes(ymax=mean.lifeExp + 2*se, 
                    ymin=mean.lifeExp - 2*se), width = 0.3)


###################################################
### code chunk number 93: workshop1_slides.Rnw:1443-1446
###################################################
ggplot(gapminder, aes(x=year, y=pop)) + 
  geom_point(alpha=.3) + 
  geom_smooth()


###################################################
### code chunk number 94: line
###################################################
ggplot(gapminder, aes(x=year, y=pop, group=country)) + 
  geom_line(alpha=.3) 


###################################################
### code chunk number 95: scatter_color
###################################################
ggplot(gapminder, aes(x=year, y=gdpPercap, color=continent)) + 
  geom_point(alpha=.6) 

ggplot(gapminder, aes(x=year, y=gdpPercap, 
                      color=continent, fill=continent)) + 
  geom_point(alpha=.6) + 
  geom_smooth()


###################################################
### code chunk number 96: hist_color
###################################################
ggplot(gapminder, aes(x=lifeExp, fill=continent)) + 
  geom_histogram() 


###################################################
### code chunk number 97: workshop1_slides.Rnw:1486-1487
###################################################
?theme


###################################################
### code chunk number 98: theme
###################################################
ggplot(gapminder, aes(x=year, y=gdpPercap, 
                      color=continent, fill=continent)) + 
  geom_point(alpha=.6) + 
  geom_smooth() + 
  theme_bw()


###################################################
### code chunk number 99: workshop1_slides.Rnw:1503-1511
###################################################
ggplot(gapminder, aes(x=year, y=gdpPercap, 
                      color=continent, fill=continent)) + 
  geom_point(alpha=.6, show.legend = FALSE) + 
  geom_smooth(show.legend = FALSE) + 
  theme(axis.title.x=element_blank(), 
        axis.text.x =element_text(angle=90)) + 
  xlim(c(1970, 2007)) + 
  labs(title="GDP per capita over time")


###################################################
### code chunk number 100: log_trans
###################################################
ggplot(gapminder, aes(x=year, y=gdpPercap, 
                      color=continent, fill=continent)) + 
  geom_point(alpha=.6) + 
  geom_smooth() + 
  scale_y_log10()


###################################################
### code chunk number 101: workshop1_slides.Rnw:1535-1538
###################################################
ggplot(plot.data, aes(y=continent, x=mean.lifeExp)) + 
  geom_point() + 
  geom_errorbarh(aes(xmax=mean.lifeExp + 2*se, xmin=mean.lifeExp - 2*se), height=.1 )


###################################################
### code chunk number 102: workshop1_slides.Rnw:1541-1544
###################################################
ggplot(plot.data, aes(y=reorder(continent, mean.lifeExp), x=mean.lifeExp)) + 
  geom_point() + 
  geom_errorbarh(aes(xmax=mean.lifeExp + 2*se, xmin=mean.lifeExp - 2*se), height=.1 )


###################################################
### code chunk number 103: workshop1_slides.Rnw:1550-1554
###################################################
ggplot(plot.data, aes(x=reorder(continent, mean.lifeExp), y=mean.lifeExp)) + 
  geom_point() + 
  geom_errorbar(aes(xmax=mean.lifeExp + 2*se, xmin=mean.lifeExp - 2*se), height=.1 ) +
  coord_flip()


###################################################
### code chunk number 104: workshop1_slides.Rnw:1563-1566
###################################################
levels(plot.data$continent)
plot.data$continent <- factor(plot.data$continent, 
                              levels=c("Americas", "Europe", "Africa", "Asia", "Oceania"))


###################################################
### code chunk number 105: workshop1_slides.Rnw:1569-1572
###################################################
ggplot(plot.data, aes(y=continent, x=mean.lifeExp)) + 
  geom_point() + 
  geom_errorbarh(aes(xmax=mean.lifeExp + 2*se, xmin=mean.lifeExp - 2*se), height=.1 )


###################################################
### code chunk number 106: workshop1_slides.Rnw:1581-1583
###################################################
head(diamonds)
str(diamonds)


###################################################
### code chunk number 107: workshop1_slides.Rnw:1588-1594
###################################################
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(alpha=.2) + 
  scale_x_log10() + 
  scale_y_log10() + 
  geom_smooth(method="lm") + 
  ggtitle("Diamonds")


###################################################
### code chunk number 108: workshop1_slides.Rnw:1604-1607
###################################################
ggplot(diamonds, aes(x=price, fill=cut, color=cut)) + 
  geom_density(alpha=.4) + 
  labs(y=NULL)


###################################################
### code chunk number 109: workshop1_slides.Rnw:1617-1621
###################################################
ggplot(diamonds, aes(x=price, fill=cut, color=cut)) + 
  geom_density(alpha=.4) + 
  labs(y=NULL) + 
  facet_wrap(~ color)


