#Import Lib
library(dplyr)

#Import mpg file
#demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
mpg_table <- read.csv(file='./Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Linear Regression
#lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)
mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table)
mpg_lm

#View using summary
summary(mpg_lm)


#import suspension file
sus_table <- read.csv(file='./Data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#summary table
total_summary <- sus_table %>%
  summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
total_summary

#table grouped by lot
lot_summary <- sus_table %>%
  group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
lot_summary

#T-tests
t.test(sus_table$PSI, mu=1500)

#t-tests by lot
t.test(subset(sus_table, Manufacturing_Lot =="Lot1")$PSI, mu=1500)
t.test(subset(sus_table, Manufacturing_Lot =="Lot2")$PSI, mu=1500)
t.test(subset(sus_table, Manufacturing_Lot =="Lot3")$PSI, mu=1500)
