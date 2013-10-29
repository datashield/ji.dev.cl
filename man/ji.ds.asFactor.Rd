\name{ji.ds.asFactor}
\alias{ji.ds.asFactor}
\title{Turns a vector into factor type}
\usage{
  ji.ds.asFactor(datasources = NULL, xvect = NULL,
    newobj = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{xvect}{a vector.}

  \item{newobj}{the name of the new vector.If this argument
  is set to NULL, the name of the new variable is the name
  of the input variable with the suffixe '_factor' (e.g.
  'GENDER_factor', if input variable's name is 'GENDER')}
}
\value{
  a message is displayed when the action is completed.
}
\description{
  This function is similar to R function \code{as.factor}.
}
\examples{
{

# load that contains the login details
data(logindata)

# login and assign specific variable(s)
myvar <- list("GENDER") # ?????????????????????????????????????????????????????????????????????????????? another variable??????????????????
opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)

# turn the factor variable 'GENDER' into a character vector
ji.ds.asFactor(datasources=opals, xvect=quote(D$GENDER), newobj="gender_as_factor")
}
}
\author{
  Gaye, A. (amadou.gaye
}

