
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
## -------------------- operability test --------------------------------------------------------------
## > source("LexScop.R")    load R program
## > a <- makeCacheMatrix() create functions
## > a$set(diag(7,3))       create matrix in working environment
## OR create matrix another way: a <- makeCacheMatrix(matrix(c(7,0,0,0,7,0,0,0,7), nrow = 3, ncol =3))
## > a$get()                look at matrix
##      [,1] [,2] [,3]
## [1,]    7    0    0
## [2,]    0    7    0
## [3,]    0    0    7
## > cacheSolve(a)          1st run returns inverted matrix
##                          from working environment
##           [,1]      [,2]      [,3]
## [1,] 0.1428571 0.0000000 0.0000000
## [2,] 0.0000000 0.1428571 0.0000000
## [3,] 0.0000000 0.0000000 0.1428571
##
## > cacheSolve(a)          2nd and subsequent runs
##                          returns inverted matrix from cache
## getting cached data
##           [,1]      [,2]      [,3]
## [1,] 0.1428571 0.0000000 0.0000000
## [2,] 0.0000000 0.1428571 0.0000000
## [3,] 0.0000000 0.0000000 0.1428571