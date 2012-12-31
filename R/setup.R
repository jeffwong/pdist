setClass("pdist", representation(dist = "numeric",
                                 n = "numeric",
                                 p = "numeric"),
         S3methods = T)

setMethod("[", "pdist", function(x, i, j, ...) {
  if (missing(j)) j = 1:x@p
  x@dist[(i - 1) * x@p + j]
})

#' Convert pdist to a distance matrix
#'
#' pdist objects are numeric arrays, converts this to matrix
#' @param x
#' @param ...
#' @method as.matrix pdist
#' @S3method as.matrix pdist
as.matrix.pdist = function(x, ...) matrix(x@dist, x@n, x@p, byrow=T)
