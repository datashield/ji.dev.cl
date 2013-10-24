#' 
#' @title a test of an object being of type "factor"
#' @description this function is similar to R function \code{is.numeric}
#' @param datasources a list of opal object(s) obtained after login in to opal servers;
#' these objects hold also the data assign to R, as \code{dataframe}, from opal datasources.
#' @param xvect a vector to be tested
#' @return a logic value (TRUE if xvect is numeric)
#' @author Isaeva, J. (julia.isaeva@fhi.no)
#' @export
#' @examples {
#' 
#' # load that contains the login details
#' data(logindata)
#' 
#' # login
#' opals <- datashield.login(logins=logindata,assign=TRUE)
#' 
#' # Example 1: Test whether LAB_TSC variable is of type "factor"
#' ji.ds.is.factor(datasources=opals, x=quote(D$LAB_TSC))
#' 
#' # Example 2: Test whether PM_BMI_CONTINUOUS variable is of type "factor"
#' ji.ds.is.factor(datasources=opals, x=quote(D$PM_BMI_CONTINUOUS))
#' }
#' 
ji.ds.is.factor = function(datasources=NULL, xvect=NULL) {
  if(is.null(datasources)){
    message("\n\n ALERT!\n")
    message(" No valid opal object(s) provided.\n")
    message(" Make sure you are logged in to valid opal server(s).\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
  if(is.null(xvect)){
    message("\n\n ALERT!\n")
    message(" Please provide a valid matrix-like object\n")
    stop(" End of process!\n\n", call.=FALSE)
  }
  
  # call the function that checks the variable is available and not empty
  vars2check <- list(xvect)
  datasources <- ds.checkvar(datasources, vars2check)
  
  cally <- call('is.factor', x )
  factor_tests <- datashield.aggregate(datasources, cally)
  
  return(factor_tests)
}