\name{pdist}
\alias{pdist}
\title{Partitioned Distances}
\usage{
  pdist(X, Y = NULL, indices.A = NULL, indices.B = NULL)
}
\arguments{
  \item{X}{a matrix of n observations where columns
  represent features of the observations}

  \item{Y}{optional.  A second matrix of p observations
  like X.  Y must have the same number of columns as X}

  \item{indices.A}{optional.  A vector of integers
  representing row indices from X.  This should only be
  used when Y is not provided.}

  \item{indices.B}{optional.  A vector of integers
  representing row indices from X.  This should only be
  used when Y is not provided.}
}
\description{
  Compute distance matrix between two matrices of
  observations, or two subsets of one matrix
}
\details{
  pdist computes a n by p distance matrix using two
  seperate matrices.  pdist allows the user to factor out
  observations into seperate matrices to improve
  computations.  The function dist computes the distances
  between all possible pair wise elements, pdist only
  computes the distance between observations in X with
  observations in Y; distances between observations in X
  and other observations in X are not computed, and
  likewise for Y.

  If a second matrix Y is not provided, indices.A and
  indices.B can be provided together to specify subsets of
  X to be computed.  A new matrix X is created by taking
  X[indices.A,] and Y is created using X[indices.B,].

  The return value of pdist is a distance vector, much like
  the default return value for dist.  However, it can be
  accessed like a full distance matrix.  If mypdist =
  pdist(X,Y), mypdist[i,j] is the distance between X[i,]
  and Y[j,].  Similarly, mypdist[i,] is a vector of
  distances between X[i,] and all observations in Y.
}
\examples{
x = matrix(rnorm(100),10,10)
  x.pdist = pdist(x, indices.A = 1:3, indices.B = 8:10)
  message("Find the distance between observation 1 and 10 of x")
  x.pdist[1,3]
  message("Converting a pdist object into a traditional distance matrix")
  as.matrix(x.pdist)
}

