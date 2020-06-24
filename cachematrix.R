## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #assign NUll to inverse matrix
  i <- NULL
  #function set assigns the received value "y" to X in parent environment 
  #and resets the i value to null in parent environment
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  #function that returns x "matrix"
  get <- function() x
  # function that assigns the value "inverse" to I
  setinverse <- function(inverse) i <<- inverse
  #function that returns value i
  getinverse <- function() i
  #creates a list with all the functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
  # attempts to retrieve a inverse from the object passed in as the argument
  #First, it calls the getinverse() function on the input object (the list created by makeCacheMatrix)
  i <- x$getinverse()
    #if the value here is not equal to NULL, we have a valid, cached inverse 
  #and can return it to the parent environment 
  
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  # if i is null:
  #gets the matrix from the input object (the list created by makeCacheMatrix)
  data <- x$get()
  #calculates the inverse of data (matrix from the input object)
  i <- solve(data, ...)
  
  #uses the setinverse() function on the input object 
  #to set the inverse in the input object  
  x$setinverse(i)
  # and then returns the value of the inverse to the parent environment
  # by printing the inverse object.
  i
}
