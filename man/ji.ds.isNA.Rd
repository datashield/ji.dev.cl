\name{ji.ds.isNA}
\alias{ji.ds.isNA}
\title{Indicates which elements are missing}
\usage{
  ji.ds.isNA(datasources = NULL, x = NULL, newobj = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{x}{an object to be tested}

  \item{newobj}{the name of the new vector.If this argument
  is set to \code{NULL}, the name of the new variable is
  the name of the input variable with the suffixe '_isna'
  (e.g. 'LAB_TSC_isna', if input variable's name is
  'LAB_TSC')}
}
\value{
  a message is displayed when the action is completed.
}
\description{
  This function is similar to R function \code{is.na}.
}
\examples{
{

# load that contains the login details
data(logindata)

# login and assign specific variable(s)
opals <- datashield.login(logins=logindata,assign=TRUE)

# Create a vector which indicates missing values in the LAB_TSC variable
ji.ds.isNA(datasources=opals, x=quote(D$LAB_TSC))

# Create a matrix indicating missing observations in D
ji.ds.isNA(datasources=opals, x=quote(D))
}
}
\author{
  Gaye, A. (amadou.gaye
}

