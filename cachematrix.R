## Write a short comment describing this function
## initiate to null first, and then assign contents, later mimick the makevector code to set setters and getters 

makeCacheMatrix <- function(x = matrix()) {
  theInverseMatrix <- NULL
  set <- function(y) {
    x <<- y
    theInverseMatrix <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) theInverseMatrix <<- solve
  getsolve <- function() theInverseMatrix

  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
## again, revise the example code to invert the matrix and then cache it, but to be inverted, a matrix needs to have non-zero determinant. Also return Null when new data is introduced  

cacheSolve <- function(x, ...) {
   MyMatrix <- x$getsolve()
  if (!is.null(MyMatrix)) {
    message("get data")
    return(MyMatrix)
  }
    data <- x$get()
  if (!is.matrix(data)) {
    stop("invalid matrix")
  }
  if (det(data) == 0) {
    message("invalid matrix for inversion")
    x$setsolve(NULL)
    return(NULL)
  } 
    MyMatrix <- solve(data)
    x$setsolve(MyMatrix)
    MyMatrix
}

