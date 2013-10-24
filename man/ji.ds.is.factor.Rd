\name{ji.ds.is.factor}
\alias{ji.ds.is.factor}
\title{a test of an object being of type "factor"}
\usage{
  ji.ds.is.factor(datasources = NULL, xvect = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{xvect}{a vector to be tested}
}
\value{
  a logic value (TRUE if xvect is numeric)
}
\description{
  this function is similar to R function \code{is.numeric}
}
\examples{
{

# load that contains the login details
data(logindata)

# login
opals <- datashield.login(logins=logindata,assign=TRUE)

# Example 1: Test whether LAB_TSC variable is of type "factor"
ji.ds.is.factor(datasources=opals, x=quote(D$LAB_TSC))

# Example 2: Test whether PM_BMI_CONTINUOUS variable is of type "factor"
ji.ds.is.factor(datasources=opals, x=quote(D$PM_BMI_CONTINUOUS))
}
}
\author{
  Isaeva, J. (julia.isaeva
}

