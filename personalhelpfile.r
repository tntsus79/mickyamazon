

?mtcars
data(mtcars)
View(mtcars)
## View must be captializedf
## dataframe
Time_Traveler <- mtcars[mtcars$mpg < 11 & mtcars$cyl == 8 & mtcars$wt > 4,]
## column selection 
selection <- mtcars[mtcars$hp >= 100, -c(3, 5, 8:9)]
?selection

## selection picks he cars with horsepower greater to equal to 100 then selects
## the columns that it doesn't want those being columns 3, 5, 8, 9 showing the only remaining columns
## for cars that have graeter or equal to 100 horsepower

## within perameters selection
iris$Petal.Length > 6.0
iris$Petal.Length < 5.0
Long_and_Short_Virginica <-iris[which(iris$Petal.Length < 6.0 | iris$Petal.Length > 5.0),]

## make dataframe containing columns 
install.packages("dslabs")
install.packages("dplyr")
library(dslabs)
library(dplyr)
C_Overload <- temp_carbon %>% select(year, carbon_emissions)

## selecting to everything but one item in column

data("murders")
View(murders)
No_florida <- murders %>% filter(state != "Florida")

## selecting paremeters with filter 


data(mtcars)
View(mtcars)
Three_Fast_Three_Furious <- mtcars %>% filter(am == 1, cyl == 8, qsec < 15)

## filtering and selecting columns 
mtcars$disp < 250
mtcars$disp > 160
mtcars %>% filter(disp > 250 | disp < 160) %>% select(mpg, cyl, disp)
## mutate plus if else 
quake_recode <- quakes %>% select(mag) %>% mutate(ifelse(test = mag > 5, yes = "big quake", ifelse(
  test = mag < 4.2, yes = "small quake", no = "normal quake"))
) 

## mutate plus if else and using strings to add new column
View(stars)
stars_recode <- stars %>% select(star, magnitude, temp, type) %>% mutate(
  ifelse(test = type == "A" , yes = "anteater", 
         ifelse(test = type == "B" , yes = "bodybuilder" ,
                ifelse(test = type == "DA", yes = "dank", 
                       ifelse(test = type == "DB", yes = "dragon ball zed", 
                              ifelse(test = type == "DF", yes = "did not finish race", 
                                     ifelse(test = type == "F", yes = "pay repects",
                                            ifelse(test = type == "G", yes = "gigachad", 
                                                   ifelse(test = type == "K", yes = "kappa!!",
                                                          ifelse(test = type == "M", yes = "mummy", no = "orangatan")))))))))
)


## sd and mean of category 

data("olive")
View(olive)

Olive_Garden <- olive %>% group_by(area) %>% summarise(mean_oleic = mean(oleic), 
                                                       sd_oleic = sd(oleic))

data("stars")
View(stars)
twinkle_twinkle <- stars %>% group_by(type) %>% summarise(mean_temperature = mean(temp),
                                                          mean_magintude = mean(magnitude))


NBA_rebounds_per_game = sample(x = c(1.5:13.8), size=400, replace = T)

sum(NBA_rebounds_per_game > 12.5)
