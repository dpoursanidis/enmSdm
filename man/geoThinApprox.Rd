% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geoThinApprox.r
\name{geoThinApprox}
\alias{geoThinApprox}
\title{Thins a geographic points such that none are within a minimum distance of their nearest neighbor}
\usage{
geoThinApprox(x, minDist, longLat = NULL, distFunct = NULL,
  verbose = FALSE, ...)
}
\arguments{
\item{x}{Data frame, matrix, or SpatialPoints* object. See \code{Details} for further information on the coordinate reference system.}

\item{minDist}{Numeric. Minimum distance (usually in m) thinned points must be from their nearest neighbor.}

\item{distFunct}{Either a function or \code{NULL}. If \code{NULL} then \code{\link[geosphere]{distCosine}} is used to calculate distances.  More accurate distances can be obtained by using other functions (see \code{\link[geosphere]{distHaversine}} and references therein). Alternatively, a custum function can be used so long as its first argument is a 2-column numeric matrix with one row for the x- and y-coordinates of a single point and its second argument is a two-column numeric matrix with one or more rows of other points.}

\item{verbose}{Logical. If \code{TRUE} then display progress.}

\item{...}{Extra arguments to pass to \code{distFunct}.}
}
\value{
Object of class \code{x}.
}
\description{
This function thins a set of geographic points so of the remainder, none are closer than a given distance. The function is nearly the same as \code{thin.algorithm()} in the \code{spThin} package, except that it accepts a data frame, matrix, SpatialPoints, or SpatialPointsDataFrame as a main argument and the user can specify the distance function to be used.  Its key advantage over \code{thin.algorithm()} is that 1) it returns the points plus any associated data, whereas that function only returns points; and 2) it is faster, especially for large data sets.
}
\details{
If \code{x} is a data frame or a matrix then it will be assumed to be unprojected (WGS84 coordinate reference system) and \code{minDist} should be in units of meters unless the argument \code{r} (passed to the distance function using \code{...}, see \code{\link[geosphere]{distCosine}} is not in meters.
}
\examples{
x <- data.frame(long=c(-90.1, -90.1, -90.2, 20), lat=c(38, 38, 38, 38), point=letters[1:4])
set.seed(123)
geoThinApprox(x, 10000, longLat=c(1, 2)) # run #1
geoThinApprox(x, 10000, longLat=c(1, 2)) # run #2
geoThinApprox(x, 10000, longLat=c(1, 2)) # run #3
geoThinApprox(x, 10000, longLat=c(1, 2)) # run #3
geoThinApprox(x, 10, longLat=c(1, 2))
}
\seealso{
\code{\link[ENMEval]{thin.algorithm}}, \code{\link[geosphere]{distCosine}}, \code{\link{geoThin}}
}
