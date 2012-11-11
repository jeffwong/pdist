\name{pdist}
\alias{pdist}
\title{
Partitioned Distance Function
}
\description{
Compute the distances between rows of X and rows of Y
}
\usage{
pdist(X, Y)
}
\arguments{
  \item{X}{
A data matrix where each row is an observation
}
  \item{Y}{
A data matrix where each row is an observation
}
}
\details{
Calls a C implementation to calculate the euclidean distance between
the rows of X and the rows of Y.
}
\value{
A matrix where the ij-th value is the distance between row i of matrix X
and row j of matrix Y.
}
\references{
}
\author{
Jeffrey Wong
}
\note{
}

\seealso{
}
\examples{
X = matrix(1:9,3,3)
pdist(X,X)
}
\keyword{ dist }
