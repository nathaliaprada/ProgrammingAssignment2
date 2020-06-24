cachemean <- function(x, ...) {
  # attempts to retrieve a mean from the object passed in as the argument
  #First, it calls the getmean() function on the input object (the vector created by makeVector)
  m <- x$getmean()
  
  #if the value here is not equal to NULL, we have a valid, cached mean 
  #and can return it to the parent environment 
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  # if m is null:
  #gets the vector from the input object (the vector created by makeVector)
  data <- x$get()
  #calculates a mean()
  m <- mean(data, ...)
  
  #uses the setmean() function on the input object 
  #to set the mean in the input object  
  x$setmean(m)
  # and then returns the value of the mean to the parent environment
  # by printing the mean object.
  m
  
  #Note: cachemean() is the only place where the mean() function is executed
  #which is why makeVector() is incomplete without cachemean()
}