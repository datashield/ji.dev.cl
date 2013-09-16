\name{ji.ds.mean}
\alias{ji.ds.mean}
\title{Calculates a mean of a given vector (for several studies separately or combined)}
\usage{
  ji.ds.mean(opals, xvect, type = "combine")
}
\arguments{
  \item{opals}{character strings that represent the URL of
  the servers where the study datasets are stored.}

  \item{xvect}{a numerical vector}

  \item{type}{a character which represents the type of
  graph to display. If \code{type} is set to 'combine', a
  combined heatmap plot displayed and if \code{type} is set
  to 'split', each heatmap is plotted separately.}
}
\value{
  a mean value
}
\description{
  Calculates a mean of a given vector (for several studies
  separately or combined)
}
\author{
  Isaeva, J.
}

