% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aucWeighted.r
\name{aucWeighted}
\alias{aucWeighted}
\title{Calculate AUC with optional weighting}
\usage{
aucWeighted(pres, bg, presWeight = rep(1, length(pres)), bgWeight = rep(1,
  length(bg)), na.rm = FALSE)
}
\arguments{
\item{pres}{Predictions at presence sites.}

\item{bg}{Predictions at absence sites.}

\item{presWeight}{Weights of presences.}

\item{bgWeight}{Weights of absences.}

\item{na.rm}{Logical. If \code{TRUE} then remove any presences and associated weights and background predictions and associated weights with \code{NA}s.}
}
\value{
Numeric value.
}
\description{
This function calculates the area under the receiver-operator characteristic curve (AUC) following Mason, S.J. and N.E. Graham.  2002.  Areas beneath the relative operating characteristics (ROC) and relative operating levels (ROL) curves: Statistical significance and interpretation.  \emph{Quarterly Journal of the Royal Meteorological Society} 128:2145-2166. Positives and negatives values can be given weights.
}
\examples{
pres <- seq(0.5, 1, by=0.1)
bg <- seq(0, 1, by=0.01)

# unweighted
aucWeighted(pres, bg)

# weighted (weight presences with low predictions more)
presWeight <- c(1, 1, 1, 0.5, 0.5, 0.5)
aucWeighted(pres, bg, presWeight=presWeight)

# weighted (weight presences with high predictions more)
presWeight <- c(0.5, 0.5, 0.5, 1, 1, 1)
aucWeighted(pres, bg, presWeight=presWeight)

# weight presences and absences
bgWeight <- sqrt(bg)
aucWeighted(pres, bg, presWeight=presWeight, bgWeight=bgWeight)
}
\seealso{
\code{\link{Fpb}}, \code{\link{contBoyce}}, \code{\link[dismo]{evalulate}}
}
