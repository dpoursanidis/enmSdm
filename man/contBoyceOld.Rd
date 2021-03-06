% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contBoyceOld.r
\name{contBoyceOld}
\alias{contBoyceOld}
\title{The Continuous Boyce Index (CBI) with optional weighting (low coverage version).}
\usage{
contBoyceOld(pres, bg, numClasses = 10, presWeight = rep(1, length(pres)),
  bgWeight = rep(1, length(bg)), upweightTails = TRUE, na.rm = FALSE,
  autoWindow = TRUE, method = "spearman", graph = FALSE)
}
\arguments{
\item{pres}{Numeric list. Predicted values at test presences}

\item{bg}{Numeric list.  Predicted values at background sites.}

\item{numClasses}{Positive integer. Number of classes into which to divide predictions at background sites. Hirzel et al. suggest using 10 (default).}

\item{presWeight}{Numeric vector same length as \code{pres}. Relative weights of presence sites.}

\item{bgWeight}{Numeric vector same length as \code{bg}. Relative weights of background sites.}

\item{upweightTails}{Logical. \code{TRUE} ==> weights of presences and background sites that occur in the first half of the lowest bin or in the second half of the last bin  have their weights multiplied by 2.}

\item{na.rm}{Logical. If \code{TRUE} then remove any presences and associated weights and background predictions and associated weights with \code{NA}s.}

\item{autoWindow}{Logical. If TRUE then calculate bin boundaries starting at mininum predicted value and ending at maximum predicted value (default). If FALSE calculate bin boundaries starting at 0 and ending at 1.}

\item{method}{Character. Type of correlation to calculate. The default is \code{'spearman'}, the Spearman rank correlation coefficient used by Boyce et al. (2002) and Hirzel et al. (2006), which is the traditional CBI. In contrast, \code{'pearson'} or \code{'kendall'} can be used instead.  See [stats::cor()] for more details.}

\item{graph}{Logical. If TRUE then plot P vs E and P/E versus bin.}
}
\value{
Numeric value.
}
\description{
This function calculates the Continuous Boyce Index (CBI), a measure of model accuracy for presence-only test data. This function computes the CBI using bins spaced such that any given point (prediction) along [0, 1] is covered by at most 2 bins. See the function [contBoyce()] for a version that allows coverage by 2 or more bins.
}
\details{
The CBI is the Spearman rank correlation coefficient between the proportion of sites in each prediction class and the expected proportion of predictions in each prediction class based on the proportion of the landscape that is in that class. Values >0 indicte the model's output is positively correlated with the true probability of presence.  Values <0 indicate it is negatrively correlated with the true probabilty of presence.
}
\examples{
set.seed(123)
pres <- seq(0.5, 1, length.out=100)
bg <- runif(1000)
contBoyceOld(pres, bg)
presWeight <- c(rep(1, 50), rep(0.5, 50))
contBoyceOld(pres, bg, presWeight=presWeight)
}
\references{
Boyce, M.S., Vernier, P.R., Nielsen, S.E., and Schmiegelow, F.K.A.  2002.  Evaluating resource selection functions.  \emph{Ecological Modeling} 157:281-300)

Hirzel, A.H., Le Lay, G., Helfer, V., Randon, C., and Guisan, A.  2006.  Evaluating the ability of habitat suitabilioty models to predict species presences.  \emph{Ecological Modeling} 199:142-152.
}
\seealso{
\code{\link{contBoyce}}
}
