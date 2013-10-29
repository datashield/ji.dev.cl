#' 
#' @title Tests for an object being a list
#' @description this function is similar to R function \code{is.list}
#' @param datasources a list of opal object(s) obtained after login in to opal servers;
#' these objects hold also the data assign to R, as \code{dataframe}, from opal datasources.
#' @param x an object to be tested
#' @return a logic value (TRUE if xvect is numeric)
#' @author Gaye, A. (amadou.gaye@bristol.ac.uk) and Isaeva, J. (julia.isaeva@fhi.no)
#' @export
#' @examples {
#' 
#' # load that contains the login details
#' data(logindata)
#' 
#' # login
#' opals <- datashield.login(logins=logindata,assign=TRUE)
#' 
#' # Example 1: Test whether loaded datasets are lists
#' ji.ds.is.list(datasources=opals, x=quote(D))
#' 
#' }
#' 
ji.ds.is.list = function(datasources=NULL, x=NULL) {
  if(is.null(datasources)){
    message("\n\n ALERT!\n")
    message(" No valid opal object(s) provided.\n")
    message(" Make sure you are logged in to valid opal server(s).\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
  if(is.null(x)){
    message("\n\n ALERT!\n")
    message(" Please provide a valid vector\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
#   # call the function that checks the variable is available and not empty
#   vars2check <- list(xvect)
#   datasources <- ds.checkvar(datasources, vars2check)
  
  cally <- call('is.list', x )
  list_tests <- datashield.aggregate(datasources, cally)
  
  return(list_tests)
}