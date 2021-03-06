# Programming Assignment 2: Lexical Scoping
## For the Coursera course "R Programming"
    The following code demonstrates how to use the `cachematrix.R` R script.  
    Lines starting with # are simple comments.  
    Lines starting with `>` are things printed in the output. 

    > source("cachematrix.R")  #load R program  
    > a <- makeCacheMatrix()   #create function 
    > a$set(diag(7,3))         #create matrix in working environment
    #OR create matrix another way:   
    >a <- makeCacheMatrix(matrix(c(7,0,0,0,7,0,0,0,7), nrow = 3, ncol =3))
    #look at matrix
    > a$get()               
          [,1] [,2] [,3]
    [1,]    7    0    0
    [2,]    0    7    0
    [3,]    0    0    7 
    
    #1st run returns inverted matrix from working environment   
     > cacheSolve(a)  
           [,1]      [,2]      [,3]
    [1,] 0.1428571 0.0000000 0.0000000
    [2,] 0.0000000 0.1428571 0.0000000
    [3,] 0.0000000 0.0000000 0.1428571
    
    #2nd and subsequent runs 
    > cacheSolve(a)   
    #returns inverted matrix from cache
    getting cached data
               [,1]      [,2]      [,3]
     [1,] 0.1428571 0.0000000 0.0000000
     [2,] 0.0000000 0.1428571 0.0000000
     [3,] 0.0000000 0.0000000 0.1428571