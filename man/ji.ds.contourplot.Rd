\name{ji.ds.contourplot}
\alias{ji.ds.contourplot}
\title{Creates a contour plot}
\usage{
  ji.ds.contourplot(opals, xvect, yvect, type = "combine",
    numints = 20)
}
\arguments{
  \item{opals}{character strings that represent the URL of
  the servers where the study datasets are stored.}

  \item{xvect}{a numerical vector}

  \item{yvect}{a numerical vector}

  \item{type}{a character which represents the type of
  graph to display. If \code{type} is set to 'combine', a
  combined contour plot displayed and if \code{type} is set
  to 'split', each conntour is plotted separately.}

  \item{numints}{a number of intervals for a density grid
  object}
}
\value{
  a contour plot
}
\description{
  Generates a contour plot of the given data values.
}
\author{
  Burton, P., Isaeva, J. and Gaye, A.
}

