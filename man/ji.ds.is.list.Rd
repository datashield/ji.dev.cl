\name{ji.ds.is.list}
\alias{ji.ds.is.list}
\title{Tests for an object being a list}
\usage{
  ji.ds.is.list(datasources = NULL, x = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{x}{an object to be tested}
}
\value{
  a logic value (TRUE if xvect is numeric)
}
\description{
  this function is similar to R function \code{is.list}
}
\examples{
{

# load that contains the login details
data(logindata)

# login
opals <- datashield.login(logins=logindata,assign=TRUE)

# Example 1: Test whether loaded datasets are lists
ji.ds.is.list(datasources=opals, x=quote(D))

}
}
\author{
  Gaye, A. (amadou.gaye
}

