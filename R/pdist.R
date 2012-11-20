pdist = function(X, Y = NULL, indices.A = NULL, indices.B = NULL) {
  if (!is.null(Y)) {
      if (X == Y) return (as.matrix(dist(X, upper=T)))
  }
  else {
    if (is.null(indices.A) & is.null(indices.B))
      return (as.matrix(dist(X, upper=T)))
    if (length(indices.A) == nrow(X) & length(indices.B) == nrow(X))
      return (as.matrix(dist(X, upper=T)))
  }
   
  if (is.null(Y) & (!is.null(indices.A) & !is.null(indices.B))) {
      Y = X[indices.B,]
      X = X[indices.A,]
  }
 
  if (is.vector(X)) X = matrix(X, nrow = 1)
  if (is.vector(Y)) Y = matrix(Y, nrow = 1)
  if (!is.matrix(X)) X = as.matrix(X)
  if (!is.matrix(Y)) Y = as.matrix(Y)

  nx = as.integer(nrow(X))
  ny = as.integer(nrow(Y))
  p = as.integer(ncol(X))

  X.vec = as.single(as.vector(X))
  Y.vec = as.single(as.vector(Y))

  distances = single(nrow(X) * nrow(Y))

  result = .C("Rpdist", X.vec, Y.vec, nx, ny, p, distances=distances,
              NAOK = T)
  structure(list(dist = result$distances, 
                 n = nrow(X),
                 p = nrow(Y)), class = "pdist")
}

setClass("pdist", representation = "list", S3methods = T)

as.matrix.pdist = function(x) {
  matrix(x$dist, x$n, x$p, byrow=T)
}
