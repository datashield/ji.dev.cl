\name{ji.ds.class}
\alias{ji.ds.class}
\title{Retrieves the class of an object}
\usage{
  ji.ds.class(datasources = NULL, x = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{x}{an R object}
}
\value{
  class of x
}
\description{
  this function is similar to R function \code{class}
}
\examples{
{

# load that contains the login details
data(logindata)

# login
opals <- datashield.login(logins=logindata,assign=TRUE)

# Example 1: Get the class of the whole dataset
ji.ds.class(datasources=opals, x=quote(D))

# Example 2: Get the class of the variable PM_BMI_CONTINUOUS
ji.ds.class(datasources=opals, x=quote(D$LAB_TSC))
}
}
\author{
  Isaeva, J. (julia.isaeva
}

