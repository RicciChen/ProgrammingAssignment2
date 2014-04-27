## This file contains 2 functions : 
#  makeCacheMatrix() and cacheSolve() 
#  to cache and calculate the inverse of given matrix.

## Function makeCacheMatrix is to create a list to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse matrix
# 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) m <<- inverse
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,getInverse = getInverse)
}



## Function cacheSolve calculates the inverse of the matrix
#  created with function makeCacheMatrix. 
#  1.checks if the inverse has already been calculated.
#    1.1 If calculated, 
#      1.1.1  it gets the inverse from the cache 
#      1.1.2  skips the computation.
#    1.2 Otherwise, 
#      1.2.1 it calculates the inverse of the matrix 
#      1.2.2 sets the value of the inverse in the cache via the 
#            setinverse function.


cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}

## How to test function ?

#  1. Build up a invertible matrix
#     >   B <- matrix(1:4,2,2)

#  2. Assign a variable as a list to preserve spapce 
#     for matrix and its inverse
#     >   BB <- makeCacheMtrix(B)

#  3. Get cached matrix for 1st calculation ,
#     >  cacheSolve(BB)

#     It shows the inverse matrix.
#           [,1] [,2]
#     [1,]   -2  1.5
#     [2,]    1 -0.5

#  4. The inverse has already been calculated, 
#     check if the function get cached inverse 
#     and skip calculation.
#     >   cacheSolve(BB)

#     It shows the message and inverse matrix.
#     getting cached data
#           [,1] [,2]
#      [1,]   -2  1.5
#      [2,]    1 -0.5
