# log in to opals
o1<-opal.login('administrator', 'password', 'http://54.242.140.255')
o2<-opal.login('administrator', 'password', 'http://54.242.46.59')
opals<-list(o1, o2)
names(opals)<-c('Study 1', 'Study 2')

# assign data to opals
datashield.assign(opals[[1]], 'D', 'HOPsim.hopsim1ob')
datashield.assign(opals[[2]], 'D', 'HOPsim.hopsim2ob')

# LOAD THE CLIENT FUNCTION (in Rstudio you just do 'build&reload' or do library(ji.dev.cl))
# or do the same as below but give it the path to the R script
source("ji.ds.heatmapplot.R")

# LOAD THE 'fields' LIBRARY (you don't need to do it if you do 'build&reload'
# as the library 'fields' get load along with your package because it is in the dependencies)
library(fields)

# GENERATE A COMBINED HEATMAP PLOT ACROSS THE STUDIES USING THE TWO VARIABLES BELOW
ji.ds.heatmapplot(opals, quote(D$sbp), quote(D$glu), type="combine")

# GENERATE A SPLIT HEATMAP PLOT WHERE EACH STUDY IS PLOTTED SEPARATELY
# THIS WAY THE USER HAS NOW MORE FLEXIBILITY
ji.ds.heatmapplot(opals, quote(D$sbp), quote(D$glu), type="split")

# GENERATE A HEATMAP PLOT A SPECIFIC STUDY, HERE THE 2ND STUDY ONLY IS PLOTTED 
ji.ds.heatmapplot(opals[2], quote(D$sbp), quote(D$glu), type="split")

# GENERATE A SPLIT HEATMAP PLOT WITH LESS DENSE GRID
ji.ds.heatmapplot(opals, quote(D$sbp), quote(D$glu), type="split", numints=15)
