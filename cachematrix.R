
#This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    # stores the cached value
    # initialize to NULL
    m <- NULL
    # create the matrix in the working environment
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    # get the value of the matrix
    get <- function() x
    # invert the matrix and store in cache
    setinverse <- function(solve) m <<- solve
    # get the inverted matrix from cache
    getinverse <- function() m
    # return the created functions to the working environment
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
# cacheSolve calcluates the inverse of the matrix created in makeCacheMatrix
# If the inverse has already been calculated (and the matrix has not changed), 
# then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    ## attempt to get the inverse of the matrix stored in cache
    m <- x$getinverse()
    # return inverted matrix from cache if it exists
    # else create the matrix in working environment
    if(!is.null(m)) {
        message("getting cached data")
        #display matrix
        return(m)
    }
    # if matrix does not exist - create matrix
    data <- x$get()
    # Find the inverse
    m <- solve(data, ...)
    # Cache this result
    x$setinverse(m)
    # Return this new result
    m
}
