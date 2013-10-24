\name{ji.ds.is.character}
\alias{ji.ds.is.character}
\title{a test of an object being of type 'character'}
\usage{
  ji.ds.is.character(datasources = NULL, xvect = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{xvect}{a vector to be tested}
}
\value{
  a logic value (TRUE if xvect is of type "character")
}
\description{
  this function is similar to R function
  \code{is.character}
}
\examples{
{

# load that contains the login details
data(logindata)

# login
opals <- datashield.login(logins=logindata,assign=TRUE)

# Example 1: Test whether LAB_TSC variable is of type "character"
ji.ds.is.character(datasources=opals, x=quote(D$LAB_TSC))

}
}
\author{
  Isaeva, J. (julia.isaeva
}

