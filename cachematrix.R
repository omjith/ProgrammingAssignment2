## Creates cache for matrix inverse and retrieves from cache if already avialable


## Creating cache for inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <- NULL
  
  set <- function(y) {
    x <<- y
    inverseMatrix <<- NULL
  }
  get <- function()x
  setInverse <- function (mat) inverseMatrix <<- mat
  getInverse <- function() inverseMatrix
  list(set = set, get = get,getInverse = getInverse,setInverse = setInverse)

  
}


## Getting inverse from cache if available

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  m <- x$getInverse()
  
  if(!is.null(m))
  {
    message ("getting cached inverse of matrix")
     return(m)
  }
  else
  {
    m <- solve(x$get()) #inversing the matrix
    x$setInverse(m)
   
  }
  m
}
