\name{ji.ds.heatmapplot}
\alias{ji.ds.heatmapplot}
\title{Generates a heatmap plot for merged datasets}
\usage{
  ji.ds.heatmapplot(opals, xvect, yvect, type = "combine")
}
\arguments{
  \item{opals}{character strings that represent the URL of
  the servers where the study datasets are stored.}

  \item{xvect}{a numerical vector}

  \item{yvect}{a numerical vector}

  \item{type}{a character which represents the type of
  graph to display. If \code{type} is set to 'combine', a
  combined heatmap plot displayed and if \code{type} is set
  to 'split', each heatmap is plotted separately.}
}
\value{
  a heatmap plot
}
\description{
  Generates a heatmap plot for merged datasets
}
\author{
  Isaeva, J. and Gaye, A.
}

