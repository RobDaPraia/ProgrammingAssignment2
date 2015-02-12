## cacheVector.R

## Some help /explanations here: https://class.coursera.org/rprog-011/forum/thread?thread_id=105

## Let's say you have created a matrix and you have called cachemean() and the value is now cached.  
## What if I want to change the values in the matrix?  If there isn't something to reset the values 
## and invalidate the cache, the next call to cachemean() would return the wrong results.  
## So $set() should, invalidate the cache and set the internals of the vector to the new values.

## A read of ?"<<-" will help. The operators <<- and ->> are normally only used in functions, 
## and cause a search to made through parent environments for an existing definition of the variable being assigned. 
## If such a variable is found (and its binding is not locked) then its value is redefined, otherwise assignment 
## takes place in the global environment. Note that their semantics differ from that in the S language, 
## but are useful in conjunction with the scoping rules of R. See ‘The R Language Definition’ manual for further details and examples

## Lexicon, Closures, good reads: 
## http://stackoverflow.com/questions/5785290/what-is-the-difference-between-assign-and-in-r
## http://adv-r.had.co.nz/Functional-programming.html#closures

## http://stackoverflow.com/questions/24904683/caching-the-mean-of-a-vector-in-r
##
## m <- NULL begins by setting the mean to NULL as a placeholder for a future value
## set <- function(y) {x <<- y; m <<- NULL} defines a function to set the vector, x, to a new vector, y, and resets the mean, m, to NULL
## get <- function() x returns the vector, x
## setmean <- function(mean) m <<- mean sets the mean, m, to mean
## getmean <- function() m returns the mean, m
## list(set = set, get = get,setmean = setmean,getmean = getmean) returns the 'special vector' containing all of the functions just defined

## makeVector creates a special "vector", which is really a list containing a function to
## - set the value of the vector
## - get the value of the vector
## - set the value of the mean
## - get the value of the mean

## Example run:
## > x <- makeVector(c(1,2,3))
## > x$get()
## [1] 1 2 3
## > cachemean(x)
## [1] 2
## > cachemean(x)
## getting cached data
## [1] 2
## > x$set(c(4,5,6))
## > x$get()
## [1] 4 5 6
## > cachemean(x)
## [1] 5
## > cachemean(x)
## getting cached data
## [1] 5

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

## The following function calculates the mean of the special "vector" 
## created with the above function. However, it first checks to see 
## if the mean has already been calculated. If so, it gets the mean 
## from the cache and skips the computation. Otherwise, it calculates 
## the mean of the data and sets the value of the mean in the cache 
## via the setmean function.

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

