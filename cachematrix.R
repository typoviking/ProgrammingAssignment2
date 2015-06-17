## Functions will be used to cache the inverse of a matrix

## This function creates a special matrix object that can
## cache its inverse

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <-function() x
    setinv <- function(solve) inv <<- solve
    getinv <- function() inv
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## This function computes the inverse of the special matrix returned above.
## If the inverse has already been calculated for the matrix above, it will be 
## retrieved from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv<-x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
data <- x$get()
inv <- solve(data,...)
x$setinv(inv)
inv
}
