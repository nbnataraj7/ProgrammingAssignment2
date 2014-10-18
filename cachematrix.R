## We cache a matrix and its inverse in a function environment and then 
## create a list of functions to set/get their values. Using these functions
## we get the inverse of the matrix by getting it from cached variable if 
## its not changed, and if we change the matrix then we compute the inverse

## This function returns a list of functions used to set/get the matrix and
## its inverse cached inside its environment

makeCacheMatrix <- function(x = matrix()) {
# initializing inv variable with NULL, 
	# which will store the inverse of the matrix "x"
	inv <- NULL
	
	# function to set the Matrix values
	set <- function(y)
	{
		x <<- y
		inv <<- NULL
	}

	# function to retrieve the matrix values
	get <- function() {
		x
	}
	
	# function to set the inv with a computed Inverse of matrix
	setInverse <- function(inverse)
	{
		inv <<- inverse
	}
	# function to get the inverse matrix
	getInverse <- function()
	{
		inv
	}
	
	# returning the list of the above four functions
	list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)

}


## Returns the inverse of the matrix which is passed to or set in the 
## makeCacheMatrix function

cacheSolve <- function(x, ...) {
       # getting the inverse from the cached variable
	inverse   <- 	mcm$getInverse()
  
  # check whether inverse exists for this matrix
  if(is.matrix(inverse))
  {
    # Value exists and hence retrieved from 
    # the cached variable
    print("Getting the inverse of this matrix from cache")
    return(inverse)
  }
  # Inverse of this matrix is not caches and thus 
  # is computed now
  inverse <- solve(mcm$get())
  
  # cache the inverse for this matrix
  mcm$setInverse(res)
  
  # return inverse
  inverse
}
