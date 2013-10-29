#' 
#' @title a generic function which combines its arguments
#' @description This function is similar to R function \code{c}.
#' @param datasources a list of opal object(s) obtained after login in to opal servers;
#' these objects hold also the data assign to R, as \code{dataframe}, from opal datasources.
#' @param xlist a list of objects to coerce.
#' @param newobj the name of the new variable.
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
#' # Coerce LAB_TSC and LAB_TRIG variables  SILLY EXAMPLE
#' c_input = list(quote(D$LAB_TSC), quote(D$LAB_TRIG))
#' ji.ds.c(datasources=opals, xlist=c_input, newobj="LAB_TSC_TRIG")
#' 
#' # Coerce random numbers
#' c_input = list(quote(1), quote(5), quote(10))
#' ji.ds.c(datasources=opals, xlist=c_input, newobj="dummy")
#' 
#' }
#' 
ji.ds.c = function(datasources=NULL, xlist=NULL, newobj=NULL){
  
  if(is.null(datasources)){
    message("\n\n ALERT!\n")
    message(" No valid opal object(s) provided.\n")
    message(" Make sure you are logged in to valid opal server(s).\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
  if(is.null(xlist)){
    message("\n ALERT!\n")
    message(" Please provide a valid list of element to compute a product for.")
    stop(" End of process!\n", call.=FALSE)
  }
  
  # call the function that checks the variable is available and not empty
  vars2check <- xlist
  datasources <- ds.checkvar(datasources, vars2check)
  
  # call the server side function that does the job
  cally <- call('c', xlist )
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