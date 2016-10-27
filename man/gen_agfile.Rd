% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen_agfile.R
\name{gen_agfile}
\alias{gen_agfile}
\title{Autograde Autoformat CSV File Format}
\usage{
gen_agfile(yhat, prob, prob.dir = getwd())
}
\arguments{
\item{yhat}{A \code{vector}, \code{matrix}, \code{data.frame} of
predicted \eqn{y} values.}

\item{prob}{A \code{string} that indicates the name of the problem the
data should conform to. This name must match a value available
via \code{\link{get_ag_problems}}.}

\item{prob.dir}{A \code{string} containing the path to where the problem
directory is found}
}
\value{
A \code{.csv} named by the problem name alongside the date and time
the predictions were made where the observations are aligned on each new
line written to the working directory given by \code{getwd()}.
}
\description{
Creates a valid autograde file when supplied with predictions
}
\examples{

# Set seed for reproducibility
set.seed(1337)

# Simulate values
n = 100
beta = 2.5
x = beta*rnorm(n, 0, 1)
y = x + rnorm(n, 1, 2)

# Create a regression model
mod = lm(y~x)

## Predict under model
yhat = predict(mod)

gen_ag_csv(yhat,file.name="ag_org")

## Predict under new data
new = data.frame(x = seq(-3, 3, 0.5))
yhat2 = predict(mod, new)

gen_ag_csv(yhat2, prob)
}
