#Partitioned Distances

Given a matrix X with m observations and another matrix Y with n observations, Partitioned Distances computes
the m by n distance matrix.  A rectangular distance matrix can be more appropriate than a square
matrix in many applications; for example, in bipartite graphs we might be concerned with the distance between
objects in Graph A with objects in Graph B, but we may not care about the distance between objects within
Graph or Graph B.  Currently, R only has a `dist` function which returns square distance matrices.

##Performance 
`pdist` is a slightly optimized version of the native `dist` function; distances are not computed between
objects that are both in X or both in Y.  Using native functions, we could stack X and Y on top of each
other using `rbind`, and call `dist` on the result, but this would compute the (m+n) by (m+n) distance
matrix, yielding m^2 + mn + n^2 unnecessary distance computations.  If the matrices have p columns, and
the distance metric is the Euclidean metric, then p(m^2 + mn + n^2) unnecessary flops are made.  More complex
metrics, such as dynamic time warping, can run in O(p^3), which means a naive dist function would make
O(p^3(m^2 + mn + n^2)) unnecessary flops!