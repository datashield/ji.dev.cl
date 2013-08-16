#' Generates a heatmap plot for merged datasets
#'
#' @param opals character strings that represent the URL of the servers where 
#' the study datasets are stored.
#' @param xvect a numerical vector
#' @param yvect a numerical vector
#' @return a heatmap plot
#' @export
#' 
ji.ds.heatmapplot <- function(opals, xvect, yvect)
{
  
  # define the min and max of the variables across all datasets
  cally <- call("MinMax", xvect, yvect) 
  MinMax.obj <- datashield.aggregate(opals, cally)
  
  num.sources <- length(MinMax.obj)
  
  x.global.min = NULL
  x.global.max = NULL
  y.global.min = NULL
  y.global.max = NULL
  
  for (i in 1:num.sources) {
    x.global.min = c(x.global.min, MinMax.obj[[i]]['min','xvect'])
    x.global.max = c(x.global.max, MinMax.obj[[i]]['max','xvect'])
    y.global.min = c(y.global.min, MinMax.obj[[i]]['min','yvect'])
    y.global.max = c(y.global.max, MinMax.obj[[i]]['max','yvect'])
  }
  
  x.global.min = min(x.global.min)
  x.global.max = max(x.global.max)
  y.global.min = min(y.global.min)
  y.global.max = max(y.global.max)
  

  
  # generate the grid density object to plot
  cally <- call("grid.density.limits", xvect, yvect, x.global.min, x.global.max, y.global.min, y.global.max) 
  grid.density.obj <- datashield.aggregate(opals, cally)
  
  num.sources <- length(grid.density.obj)
  
  numcol<-dim(grid.density.obj[[1]])[2]
  
  Global.grid.density = matrix(0, dim(grid.density.obj[[1]])[1], numcol-2)
  for (i in 1:num.sources){
    Global.grid.density = Global.grid.density + grid.density.obj[[i]][,1:(numcol-2)]
  }
  
  par(mfrow=c(1,1))
  
  x<-grid.density.obj[[1]][,(numcol-1)]
  y<-grid.density.obj[[1]][,(numcol)]
  z<-Global.grid.density
  
  #   library('fields')
  image.plot(x,y,z, col=heat.colors(50))
  
}