Overview
--------

Functions

     square = (x) -< x * x
     square = function(x){ return x * x; };

Objects

     math =
        root: Math.sqrt
        square: square
        cube: (x) -> x * square(x)

Splats

    race = (winner, runners...) ->
        print winnder, runners
        
Existence

    alert "I knew it!" if elvis?
    
Array comprehensions:

    cubes = (math.cube(num) for num in list)
     
    
