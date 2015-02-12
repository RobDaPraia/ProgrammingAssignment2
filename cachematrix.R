## cachematrix.R

## Note: In Excel you can inverse a matrix by "=MINVERSE(B2:C3)"
## See: 
## http://blog.modelworks.ch/?p=398
## http://www.excelfunctions.net/Excel-Minverse-Function.html

## Matrix calculations in R: 
## http://www.ats.ucla.edu/stat/r/library/matrix_alg.htm
## http://www.r-tutor.com/r-introduction/matrix/matrix-construction


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## Example run:
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


## Write a short comment describing this function

## Return a matrix that is the inverse of 'x'
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

