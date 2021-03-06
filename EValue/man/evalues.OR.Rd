% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EValue.R
\name{evalues.OR}
\alias{evalues.OR}
\title{Compute E-value for an odds ratio and its confidence interval limits}
\usage{
evalues.OR(est, lo = NA, hi = NA, rare = NA, true = 1)
}
\arguments{
\item{est}{The point estimate}

\item{lo}{The lower limit of the confidence interval}

\item{hi}{The upper limit of the confidence interval}

\item{rare}{1 if outcome is rare (<15 percent at end of follow-up); 0 if outcome is not rare (>15 percent at end of follow-up)}

\item{true}{The true OR to which to shift the observed point estimate. Typically set to 1 to consider a null true effect.}
}
\description{
Returns a data frame containing point estimates, the lower confidence limit, and the upper confidence limit
on the risk ratio scale (through an approximate conversion if needed when outcome is common) as well as E-values for the point estimate and the confidence interval
limit closer to the null.
}
\examples{
# compute E-values for OR = 0.86 with CI: [0.75, 0.99]
# for a common outcome
evalues.OR( 0.86, 0.75, 0.99, rare = FALSE )

## Example 2
## Hsu and Small (2013 Biometrics) Data
## sensitivity analysis after log-linear or logistic regression

head(lead)

## log linear model -- obtain the conditional risk ratio
lead.loglinear = glm(lead ~ ., family = binomial(link = "log"), 
                         data = lead)
est = summary( lead.loglinear )$coef[2, c(1, 2)]

RR       = exp(est[1])
lowerRR  = exp(est[1] - 1.96*est[2])
upperRR  = exp(est[1] + 1.96*est[2]) 
evalues.RR(RR, lowerRR, upperRR)

## logistic regression -- obtain the conditional odds ratio
lead.logistic = glm(lead ~ ., family = binomial(link = "logit"), 
                        data = lead)
est = summary( lead.logistic )$coef[2, c(1, 2)]

OR       = exp(est[1])
lowerOR  = exp(est[1] - 1.96*est[2])
upperOR  = exp(est[1] + 1.96*est[2]) 
evalues.OR(OR, lowerOR, upperOR, rare=FALSE)
}
