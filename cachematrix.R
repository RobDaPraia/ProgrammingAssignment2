## cachematrix.R
## 
## ProgrammingAssignment2 - https://class.coursera.org/rprog-011
##
## By: Rob de Beir

## Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a 
## matrix rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). 
## Your assignment is to write a pair of functions that cache the inverse of a matrix.
##
## Write the following functions:
## 
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should 
## retrieve the inverse from the cache.
## Computing the inverse of a square matrix can be done with the solve function in R. For example, 
## if X is a square invertible matrix, then solve(X) returns its inverse.
##
## For this assignment, assume that the matrix supplied is always invertible.

## Example run:
##
## > source ("cachematrix.R")
## > my_matrix = matrix( c(1, 1, 3, 1), nrow=2, ncol=2)
## > x <- makeCacheMatrix(my_matrix)
## > x$get()
## [,1] [,2]
## [1,]    1    3
## [2,]    1    1
## > cacheSolve(x)
## [,1] [,2]
## [1,] -0.5  1.5
## [2,]  0.5 -0.5
## > cacheSolve(x)
## getting inversed matrix
## [,1] [,2]
## [1,] -0.5  1.5
## [2,]  0.5 -0.5
## >
## > my_matrix = matrix( c(1, 1, 2, 4, 1, 3, 2, 2, 1), nrow=3, ncol=3)
## > x$set(my_matrix)
## > x$get()
## [,1] [,2] [,3]
## [1,]    1    4    2
## [2,]    1    1    2
## [3,]    2    3    1
## > cacheSolve(x)
## [,1]       [,2]       [,3]
## [1,] -0.5555556  0.2222222  0.6666667
## [2,]  0.3333333 -0.3333333  0.0000000
## [3,]  0.1111111  0.5555556 -0.3333333
## > cacheSolve(x)
## getting inversed matrix
## [,1]       [,2]       [,3]
## [1,] -0.5555556  0.2222222  0.6666667
## [2,]  0.3333333 -0.3333333  0.0000000
## [3,]  0.1111111  0.5555556 -0.3333333
## > 


## Helper function to cache the inverse of a matrix
makeCacheMatrix <- function(x = matrix()) {
  
  m2 <- NULL
  set <- function(y) {
    x <<- y
    m2 <<- NULL
  }
  get <- function() x
  setSolved <- function(solved) m2 <<- solved
  getSolved<- function() m2
  list(set = set, get = get,
       setSolved = setSolved,
       getSolved = getSolved)

}

## Return a matrix that is the inverse of 'x'
## Cache the inverse if calculation of 'x' is needed again
cacheSolve <- function(x, ...) {
  
  m2 <- x$getSolved()
  if(!is.null(m2)) {
    message("getting inversed matrix")
    return(m2)
  }
  data <- x$get()
  m2 <-  solve(data, ...)
  x$setSolved(m2)
  m2
}

