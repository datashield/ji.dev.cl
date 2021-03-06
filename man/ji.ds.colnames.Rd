\name{ji.ds.colnames}
\alias{ji.ds.colnames}
\title{Retrieves column names of a matrix-like object}
\usage{
  ji.ds.colnames(datasources = NULL, x = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{x}{a matrix-like object}
}
\value{
  a string containing column names of the given object
}
\description{
  this function is similar to R function \code{colnames}
}
\examples{
{

# load that contains the login details
data(logindata)

# login
opals <- datashield.login(logins=logindata,assign=TRUE)

# Example 1: Get the column names of the assigned datasets
ji.ds.colnames(datasources=opals, x=quote(D))

# Example 2: Vectors are wrong input to the colnames function
ji.ds.colnames(datasources=opals, x=quote(D$LAB_TSC))
}
}
\author{
  Gaye, A. (amadou.gaye
}

