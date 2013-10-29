\name{ji.ds.c}
\alias{ji.ds.c}
\title{a generic function which combines its arguments}
\usage{
  ji.ds.c(datasources = NULL, xlist = NULL, newobj = NULL)
}
\arguments{
  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}

  \item{xlist}{a list of objects to coerce.}

  \item{newobj}{the name of the new variable.}
}
\value{
  a message is displayed when the action is completed.
}
\description{
  This function is similar to R function \code{c}.
}
\examples{
{

# load that contains the login details
data(logindata)

# login and assign specific variable(s)
opals <- datashield.login(logins=logindata,assign=TRUE)

# Coerce LAB_TSC and LAB_TRIG variables  SILLY EXAMPLE
c_input = list(quote(D$LAB_TSC), quote(D$LAB_TRIG))
ji.ds.c(datasources=opals, xlist=c_input, newobj="LAB_TSC_TRIG")

}
}
\author{
  Gaye, A. (amadou.gaye
}

