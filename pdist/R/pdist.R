pdist = function(X, Y) {
  if(!is.matrix(X)) X = as.matrix(X)
  if(!is.matrix(Y)) Y = as.matrix(Y)

  nx = as.integer(nrow(X))
  ny = as.integer(nrow(Y))
  p = as.integer(ncol(X))

  X.vec = as.single(as.vector(X))
  Y.vec = as.single(as.vector(Y))

  distances = single(nrow(X) * nrow(Y))

  result = .C("Rpdist", X.vec, Y.vec, nx, ny, p, distances=distances)
  matrix(result$distances, nrow(X), nrow(Y), byrow=T)
}
