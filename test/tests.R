# log in to opals
server1 <- opal.login('administrator', 'password', 'http://54.242.140.255')
server2 <- opal.login('administrator', 'password', 'http://54.242.46.59')
server3 <- opal.login('administrator', 'password', 'http://23.22.215.42')
opals <- list(server1,server2,server3)
names(opals) <- c("Study1", "Study2", "Study3")

# assign data to opals
datashield.assign(server1, 'D', 'CNSIM.CNSIM')
datashield.assign(server2, 'D', 'CNSIM.CNSIM')
datashield.assign(server3, 'D', 'CNSIM.CNSIM')

# LOAD THE CLIENT FUNCTION (in Rstudio you just do 'build&reload' or do library(ji.dev.cl))
# or do the same as below but give it the path to the R script
source("ji.ds.heatmapplot.R")

# LOAD THE 'fields' LIBRARY (you don't need to do it if you do 'build&reload'
# as the library 'fields' get load along with your package because it is in the dependencies)
library(fields)

# GENERATE A COMBINED HEATMAP PLOT ACROSS THE STUDIES USING THE TWO VARIABLES BELOW
ji.ds.heatmapplot(opals, quote(D$LAB_TSC), quote(D$LAB_HDL), type="combine")

# GENERATE A SPLIT HEATMAP PLOT WHERE EACH STUDY IS PLOTTED SEPARATELY
# THIS WAY THE USER HAS NOW MORE FLEXIBILITY
ji.ds.heatmapplot(opals, quote(D$LAB_TSC), quote(D$LAB_HDL), type="split")

# GENERATE A HEATMAP PLOT A SPECIFIC STUDY, HERE THE 2ND STUDY ONLY IS PLOTTED 
ji.ds.heatmapplot(opals[2], quote(D$LAB_TSC), quote(D$LAB_HDL), type="split")

# GENERATE A SPLIT HEATMAP PLOT WITH LESS DENSE GRID
ji.ds.heatmapplot(opals, quote(D$LAB_TSC), quote(D$LAB_HDL), type="split", numints=15)
