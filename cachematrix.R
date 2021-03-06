## The overall purpose of the below functions is to create a special matrix object that can cache 
## its inverse. If the inverse has been previously calculated then retrieve inverse from cache


# makeCacheMatrix: return a list of functions to:
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  # inv will store the cached inverse matrix
  inv <- NULL
  
  # Set the value of the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  # Get the value of the matrix
  get <- function() x
  
  # Setter the value of theinverse
  setinv <- function(inverse) inv <<- inverse
  # Get the valoe of inverse
  getinv <- function() inv
  
  # Return the matrix with our newly defined functions
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

# cacheSolve: Compute the inverse of the matrix. If the inverse is already
# calculated before, it returns the cached inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  
  # If the inverse is already calculated, return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # The inverse is not yet calculated, so we calculate it
  data <- x$get()
  inv <- solve(data, ...)
  
  # Cache the inverse
  x$setinv(inv)
  
  # Return inverse
  inv
}
