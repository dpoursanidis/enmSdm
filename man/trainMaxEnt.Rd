% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trainMaxEnt.r
\name{trainMaxEnt}
\alias{trainMaxEnt}
\title{Calibrate a Maxent (ver 3.3.3- or "maxent") model using AICc}
\usage{
trainMaxEnt(data, resp = names(data)[1], preds = names(data)[2:ncol(data)],
  regMult = c(seq(0.5, 5, by = 0.5), 6:10, 12.5, 15, 17.5, 20),
  classes = "default", testClasses = TRUE, forceLinear = TRUE,
  jackknife = TRUE, args = "", out = "model", anyway = TRUE,
  scratchDir = NULL, verbose = FALSE, ...)
}
\arguments{
\item{data}{Data frame or matrix. Environmental predictors (and no other fields) for presences and background sites.}

\item{resp}{Character or integer. Name or column index of response variable. Default is to use the first column in \code{data}.}

\item{preds}{Character list or integer list. Names of columns or column indices of predictors. Default is to use the second and subsequent columns in \code{data}.}

\item{regMult}{Numeric vector. Values of the master regularization parameters (called \code{beta} in some publications) to test.}

\item{classes}{Character list. Names of feature classes to use (either \code{default} to use \code{lpqh} or any combination of \code{lpqht}), where \code{l} ==> linear features, \code{p} ==> product features, \code{q} ==> quardatic features, \code{h} ==> hinge features, and \code{t} ==> threshold features.}

\item{testClasses}{Logical.  If TRUE then test all possible combinations of classes (note that all tested models will at least have linear features). If FALSE then use the classes provided (these will not varu between models).}

\item{forceLinear}{Logical. If TRUE then require any tested models to include at least linear features.}

\item{jackknife}{Logical. If TRUE the the returned model will be also include jackknife testing of variable importance.}

\item{args}{Character list. Options to pass to \code{maxent()}'s \code{args} argument. (Do not include \code{l}, \code{p}, \code{q}, \code{h}, \code{t}, \code{betamultiplier}, or \code{jackknife}!)}

\item{out}{Character. Indicates type of value returned. If \code{model} then returns an object of class \code{maxnet}. If \code{tuning} then just return the AICc table for each kind of model term used in model construction. If both then return a 2-item list with the best model and the AICc table.}

\item{anyway}{Logical. If no model has fewer coefficients than predictors, return the model with the lowest AICc anyway.}

\item{scratchDir}{Character. Directory to which to write temporary files. Leave as NULL to create a temporary folder in the current working directory.}

\item{verbose}{Logical. If TRUE report progress and AICc table.}

\item{...}{Arguments to pass to \code{maxent()} or \code{predict.maxent()}.}
}
\value{
If \code{out = 'model'} this function returns an object of class \code{MaxEnt}. If \code{out = 'tuning'} this function returns a data frame with tuning parameters, log likelihood, and AICc for each model tried. If \code{out = c('model', 'tuning'} then it returns a list object with the \code{MaxEnt} object and the data frame.
}
\description{
This function calculates the "best" Maxent model using AICc across all possible combinations of a set of master regularization parameters and feature classes.  See Warren, D.L. and S.N. Siefert.  2011.  Ecological niche modeling in Maxent: The importance of model complexity and the performance of model selection criteria.  **Ecological Applications** 21:335-342.  The function returns the best model and/or a data frame with AICc for each value of the multipler and combination of classes.
}
\details{
This function is a wrapper for \code{maxent()}. That function relies on a maxent \code{jar} file being placed into the folder \code{./library/dismo/java}. See \code{\link[dismo]{maxent }}for more details. The \code{maxent()} function creates a series of files on disc for each model. This function assumes you do not want those files, so deletes most of them. However, there is one that cannot be deleted and the normal ways of changing its permissions in \code{R} do not work. So the function simply writes over that file (which is allowed) to make it smaller. Regardless, if you run many models your temporary directory (argument \code{scratchDir}) can fill up and require manual deletion.
}
\examples{
set.seed(123)
x <- matrix(rnorm(n = 6*100), ncol = 6)
# true variables will be #1, #2, #5, and #6, plus
# the squares of #1 and #6, plus
# interaction between #1 and #6
# the cube of #5
imp <- c('x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x1_pow2', 'x6_pow2', 'x1_by_x6', 'x5_pow3')
betas <- c(5, 2, 0, 0, 1, -1, 8, 1, 2, -4)
names(betas) <- imp
y <- 0.5 + x \%*\% betas[1:6] + betas[7] * x[ , 1] +
betas[8] * x[ , 6] + betas[9] * x[ , 1] * x[ , 6] + betas[10] * x[ , 5]^3
y <- as.integer(y > 10)
x <- cbind(y, x)
x <- as.data.frame(x)
names(x) <- c('y', 'x1', 'x2', 'x3', 'x4', 'x5', 'x6')
model <- trainMaxEnt(x, regMult=1:2, out=c('model', 'tuning'), verbose=TRUE)
model$tuning
model$model@lambdas
}
\seealso{
\code{\link[maxnet]{maxnet}}, \code{\link[dismo]{maxent}}, \code{\link{trainMaxNet}}
}
