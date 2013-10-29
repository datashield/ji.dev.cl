#' 
#' @title Ignores its argument and returns the value \code{NULL}.
#' @description This function is similar to R function \code{as.null}. 
#' @param datasources a list of opal object(s) obtained after login in to opal servers;
#' these objects hold also the data assign to R, as \code{dataframe}, from opal datasources.
#' @param x an object to be turned into \code{NULL}
#' @param newobj the name of the new vector.If this argument is set to \code{NULL}, the name of the new 
#' variable is the name of the input variable with the suffixe '_null' (e.g. 'LAB_TSC_matrix', if input 
#' variable's name is 'LAB_TSC')
#' @return a message is displayed when the action is completed.
#' @author Gaye, A. (amadou.gaye@bristol.ac.uk) and Isaeva, J. (julia.isaeva@fhi.no)
#' @export
#' @examples {
#' 
#' # load that contains the login details
#' data(logindata)
#' 
#' # login and assign specific variable(s)
#' opals <- datashield.login(logins=logindata,assign=TRUE)
#' 
#' # turn the LAB_TSC variable into \code{NULL}
#' ji.ds.asNull(datasources=opals, x=quote(D$LAB_TSC))
#' }
#' 
ji.ds.asNull = function(datasources=NULL, x=NULL, newobj=NULL){
  
  if(is.null(datasources)){
    message("\n ALERT!\n")
    message(" No valid opal object(s) provided.")
    message(" Make sure you are logged in to valid opal server(s).")
    stop(" End of process!\n", call.=FALSE)
  }
  
  if(is.null(x)){
    message("\n ALERT!\n")
    message(" Please provide a valid input.")
    stop(" End of process!\n", call.=FALSE)
  }
  
  #   # call the function that checks the variable is available and not empty
  #   vars2check <- list(x)
  #   datasources <- ds.checkvar(datasources, vars2check)
  
  # the input variable might be given as column table (i.e. D$x)
  # or just as a vector not attached to a table (i.e. x)
  # we have to make sure the function deals with each case
  inputterms <- unlist(strsplit(deparse(x), "\\$", perl=TRUE))
  if(length(inputterms) > 1){
    varname <- strsplit(deparse(x), "\\$", perl=TRUE)[[1]][2]
  }else{
    varname <- deparse(x)
  }
  
  # create a name by default if user did not provide a name for the new variable
  if(is.null(newobj)){
    newobj <- paste0(varname, "_null")
  }
  
  # call the server side function that does the job
  cally <- call('as.null', x )
  datashield.assign(datasources, newobj, cally)
  
  # a message so the user know the function was run (assign function are 'silent')
  message("An 'assign' function was run, no output should be expected on the client side!")
  
  # check that the new object has been created and display a message accordingly
  cally <- call('exists', newobj )
  qc <- datashield.aggregate(datasources, cally)
  indx <- as.numeric(which(qc==TRUE))
  if(length(indx) == length(datasources)){
    message("The output of the function, '", newobj, "', is stored on the server side.")
  }else{
    if(length(indx) > 0){
      warning("The output object, '", newobj, "', was generated only for ", names(datasources)[indx], "!")
    }
    if(length(indx) == 0){
      warning("The output object has not been generated for any of the studies!")
    }
  }
  
}