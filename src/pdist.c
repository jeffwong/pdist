#include <math.h>

//Euclidean distance between two vectors
float dist(float* x, float *y, int nx, int ny, int p)
{
  float distance = 0;
  for(int i = 0; i < p; i++)
  {
    //i*nx is the ith feature of the nxth row
    float xi = x[i*nx];
    float yi = y[i*ny];
    if (isnan(xi) || isnan(yi)) {
        continue;
    }
    float diff = xi - yi;
    distance += (diff*diff);
  }
  return sqrt(distance);
}

//C implementation of pdist
//X is a matrix represented as a vector.  Columns of X are features
//Y is a matrix represented as a vector.  Columns of Y are features
//Rnx is the number of observations (rows) in X
//Rny is the number of observations (rows) in Y
//Rp is the length of the vectors in X and Y
void Rpdist(float* X, float* Y, int* Rnx, int* Rny, int* Rp, float* distances)
{
  int nx = Rnx[0];
  int ny = Rny[0];
  int p = Rp[0];
  for(int i = 0; i < nx; i++) 
  {
    float* x = X + i;  //a pointer to the beginning of the ith row of X
    for(int j = 0; j < ny; j++)
    {
      float* y = Y + j;
      float distance = dist(x,y,nx,ny,p);
      distances[i*ny+j] = distance;
    }
  }
}
