#1 Install and activate (“library()”) the sqldf package in RStudio. With any new package it is possible to run into installation issues depending on your platform and the versions of software you are running, so monitor your diagnostic messages carefully.
library(sqldf)
#3 (a) Make sure the built-in “airquality” dataset is available for use in subsequent commands (hint: print head(airquality)). It would be wise to reveal the first few records of air quality with head() to make sure that air quality is available. This will also show you the names of the columns of the air quality dataframe which you will need to use in SQL commands. (b) assign airquality to an object “air” (c) what is the data type of air? You must use a simple command to reveal the data type.
head(airquality)
air <- airquality
typeof(air)
#4 (a) Using sqldf(), run an SQL select command that calculates the average level of ozone across all records. Assign the resulting value into a variable (average_ozone) and (b) print it out in the console.
average_ozone <-sqldf ("SELECT AVG(Ozone) FROM air")
average_ozone
#5 Again using sqldf(), run another SQL command that selects all of the records from air quality where the value of ozone is higher than the average. Note that it is possible to combine steps 4 and 5 into a single SQL command – those who are familiar with SQL syntax and usage should attempt to do so (1 point
averageozone <- sqldf("SELECT * FROM air WHERE Ozone > (SELECT AVG(Ozone) FROM air)")
#6 (a) Refine step 5 to write the result table into a new R data object called “newAQ.” (b) Then run a command to reveal what type of object newAQ is, (c) another command to show what its dimensions are (i.e., how many rows and columns), and (d) a head() command to show the first few rows.
newAQ <- sqldf("SELECT * FROM averageozone")
dim(newAQ)
typeof(newAQ)
sqldf("SELECT AVG(Ozone) FROM newAQ")
sqldf("SELECT COUNT(*) FROM newAQ")
sqldf("SELECT (Ozone) FROM newAQ ")
head(newAQ)
 
#7 Steps above was done using a SQL way. Now, repeat steps 4, 5 and 6 in an R way, using R commands including str, mean, head, dim, which, and tapply, which is a more “R” like way to do the analysis ("a" through "g" below)

# Repeat step 4: calculates the average level of ozone across all records.

#(a) Exclude Missing Values from calculating "Ozone" mean and assign the result to "average_ozone": Hint:use na.rm
average_ozone <- mean(air$Ozone, na.rm = TRUE)
# (b) print the result (average_ozone)
average_ozone

# Repeat step 5

# (c) select rows with bigger values than the average ozone value
######wrong approach: data$Ozone > meanOzone
#[1] FALSE FALSE FALSE FALSE    NA FALSE FALSE FALSE FALSE    NA FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[23] FALSE FALSE
###################
# (d) Repeat step 6
# only keep the rows in which the Ozone values are higher than the average, and write the result table into a new R data object called "newAQ2"
newAQ2 <- air[which(air$Ozone > average_ozone), ]
# (e) reveal what type of object newAQ2 is
typeof(newAQ2)
# (f) reveal the number of rows, then reveal the number of columns
dim(newAQ2)
# (g) show the first few rows of "newAQ2"
head(newAQ2)



