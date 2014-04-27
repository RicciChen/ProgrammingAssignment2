## Cachematrix.R

Includes 2 functions : **makeCacheMatrix()** and **cacheSolve()** to cache and calculate the inverse of given matrix.


### makeCacheMatrix() 

Function **makeCacheMatrix()** create a list to

1. set the value of the matrix via function *set()*
2. get the value of the matrix via function *get()*
3. set the value of the inverse matrix via function *setInverse()*
4. get the value of the inverse matrix via function *getInverse*

```{r}
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
```

### Example

Note that **makeCacheMatrix()** doesn't do any calculation.
For example :

```{r}
        B <- matrix(1:4,2,2)
        BB <- makeCacheMtrix(B)
        BB
```
It shows results as below.

```
$set
function (y) 
{
    x <<- y
    m <<- NULL
}
<environment: 0x000000001347d430>

$get
function () 
x
<environment: 0x000000001347d430>

$setmean
function (mean) 
m <<- mean
<environment: 0x000000001347d430>

$getmean
function () 
m
<environment: 0x000000001347d430>
```

### Function cacheSolve()

Function **cacheSolve()** calculates the inverse of the matrix passed by **makeCacheMatrix()**.

Checks if the inverse has already been calculated.

1. If calculated, 
 *  it gets the inverse from the cache 
 *  skips the computation.   

2. Otherwise, 
 *  it calculates the inverse of the matrix 
 *  sets the value of the inverse in the cache via the   setinverse function.


```{r}
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
```
Like playing catch-ball ,input the list created by **makeCacheMatrix()** into **cacheSolve()** , not the original matrix we want to calculate.

### Example (continued)

For example, do first calculation,

```{r}
cacheSolve(BB)
```
return the inverse matrix of B.

```
             [,1] [,2]
       [1,]   -2  1.5
       [2,]    1 -0.5
```
Try again .

```{r}
cacheSolve(BB)
```
**cacheSolve()** find the cached inverse and skip the calculation. 
```
        getting cached data
             [,1] [,2]
       [1,]   -2  1.5
       [2,]    1 -0.5
```

