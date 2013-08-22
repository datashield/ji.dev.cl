#' Generates a contour plot of the given data values.
#' @title Creates a contour plot
#' @param opals character strings that represent the URL of the servers where 
#' the study datasets are stored.
#' @param xvect a numerical vector 
#' @param yvect a numerical vector
#' @param type a character which represents the type of graph to display. 
#' If \code{type} is set to 'combine', a combined contour plot displayed and 
#' if \code{type} is set to 'split', each conntour is plotted separately.
#' @param numint a number of intervals for a density grid object
#' @return a contour plot
#' @author Burton, P.
#' @export
ji.ds.contourplot <- function(opals, xvect, yvect, type='combine', numints=20){
  
  # labels for the x and y-axis 
  x.lab <-  strsplit(deparse(xvect), "\\$", perl=TRUE)[[1]][2]
  y.lab <- strsplit(deparse(yvect), "\\$", perl=TRUE)[[1]][2]
  
  # name of the studies to be used in the plots' titles
  stdnames <- names(opals)
  
  # generate the grid density object to plot
  cally <- call("ag.densitygrid.ds", xvect, yvect, numints) 
  grid.density.obj <- datashield.aggregate(opals, cally)
  
  numplots <- length(grid.density.obj)
  nrow<-1
  ncol<-1
  
  if(is.atomic(grid.density.obj)==FALSE){
    if(numplots==2)
    {
      ncol<-2
    }
    
    if(numplots==3|numplots==4)
    {
      nrow<-2
      ncol<-2
    }
    
    if(numplots==5|numplots==6)
    {
      nrow<-2
      ncol<-3
    }
    
    if(numplots>6)
    {
      nrow<-4
      ncol<-4
    }
  }
  par(mfrow=c(nrow,ncol))
  
  if(is.atomic(grid.density.obj)==FALSE)
  {
    for(j in 1:numplots)
    {
      numcols<-dim(grid.density.obj[[j]])[2]
      x<-grid.density.obj[[j]][,(numcols-1)]
      y<-grid.density.obj[[j]][,(numcols)]
      z<-grid.density.obj[[j]][,1:(numcols-2)]
      contour(x,y,z) 
      
    }
  }
  
  
  if(is.atomic(grid.density.obj))
  {
    numcols<-dim(grid.density.obj)[2]
    x<-grid.density.obj[,(numcols-1)]
    y<-grid.density.obj[,(numcols)]
    z<-grid.density.obj[,1:(numcols-2)]
    contour(x,y,z)
  }
}