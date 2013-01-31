\name{pdist-package}
\alias{pdist-package}
\docType{package}
\title{
Distances between Observations for a Partitioned Matrix
}
\description{
    Computes the euclidean distance between rows of a matrix X
    and rows of another matrix Y.  Previously, this could be done by
    binding the two matrices together and calling 'dist', but this creates
    unnecessary computation by computing the distances between a row of X
    and another row of X, and likewise for Y.  pdist strictly computes
    distances across the two matrices, not within the same matrix, making
    computations significantly faster for certain use cases.
}
\details{
\tabular{ll}{
Package: \tab pdist\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2013-01-31\cr
License: \tab GPL\cr
LazyLoad: \tab yes\cr
}
}
\author{
Jeffrey Wong <jeff.ct.wong@gmail.com>
}
\keyword{ package }
