#' 
#' @title Calculates a mean of a given vector (for several studies separately or combined)
#' @param opals character strings that represent the URL of the servers where 
#' the study datasets are stored.
#' @param xvect a numerical vector
#' @param type a character which represents the type of graph to display. 
#' If \code{type} is set to 'combine', a combined heatmap plot displayed and 
#' if \code{type} is set to 'split', each heatmap is plotted separately.
#' @return a mean value
#' @author Isaeva, J.
#' @export
#' 
ji.ds.mean = function(opals, xvect, type='combine')
{
  
  if(is.null(opals)){
    cat("\n\n ALERT!\n")
    cat(" No valid opal object(s) provided.\n")
    cat(" Make sure you are logged in to valid opal server(s).\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
  if(is.null(xvect)){
    cat("\n\n ALERT!\n")
    cat(" Please provide a valid numeric vector\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
  # labels for the x and y-axis 
  x.lab <- strsplit(deparse(xvect), "\\$", perl=TRUE)[[1]][2]
  
  # call the function that checks the variable is available and not empty
  vars2check <- list(xvect)
  opals <- ds.checkvar(opals, vars2check)
  
  # name of the studies to be used in the output
  stdnames <- names(opals)
  
  # number of studies
  num.sources <- length(opals)
  
  cally <- call("colMeans", a) 
  mean.local <- datashield.aggregate(opals, cally)
  
  cally = call('NROW', a)
  length.local <- datashield.aggregate(opals, cally)
  
  if (type=='split') {
    return(mean.local)
  } else if (type=='combine') {
    length.total = 0
    sum.weighted = 0
    mean.global  = NA
    
    for (i in 1:num.sources){
      if ((!is.null(length.local[[i]])) & (length.local[[i]]!=0)) {
        length.total = length.total+length.local[[i]]
        sum.weighted = sum.weighted+length.local[[i]]*mean.local[[i]]
      }
    }
    
    mean.global = sum.weighted/length.total
    
    if (!is.na(mean.global))
      cat('\nGlobal mean = ', mean.global, '\n')
    
  } else{
    stop('Function argument "type" has to be either "combine" or "split"')
  }
  
}