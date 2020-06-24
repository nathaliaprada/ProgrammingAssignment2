# function that receives a  numeric vector 

makeVector <- function(x = numeric()) {
  #asign NUll to mean value
  m <- NULL
  #function set assigns the received value "y" to X in parent environment 
  #and resets the m value to null in parent enviroment
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  #function that returns x "vector"
  get <- function() x
  # function that assigns the value "mean" to m
  setmean <- function(mean) m <<- mean
  #function that returns value m
  getmean <- function() m
  #creates a list with all the functions
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}