pdist = function(X, Y = NULL, indices.A = NULL, indices.B = NULL) {
  if (is.null(Y)) {
      Y = X[indices.B,]
      X = X[indices.A,]
  }
  
  if(!is.matrix(X)) X = as.matrix(X)
  if(!is.matrix(Y)) Y = as.matrix(Y)

  nx = as.integer(nrow(X))
  ny = as.integer(nrow(Y))
  p = as.integer(ncol(X))

  X.vec = as.single(as.vector(X))
  Y.vec = as.single(as.vector(Y))

  distances = single(nrow(X) * nrow(Y))

  result = .C("Rpdist", X.vec, Y.vec, nx, ny, p, distances=distances,
              NAOK = T)
  matrix(result$distances, nrow(X), nrow(Y), byrow=T)
}
