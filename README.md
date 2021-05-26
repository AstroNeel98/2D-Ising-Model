# 2D-Ising-Model
Here is a code to run, 2D Ising Model in Matlab, using the metropolis algorithm.

Introducing the Varaibles 
N: is the size of the nxn grid.
KT: is the temprature of the system, set to 1 by default.
GH: Is a history vector that stores the state of the Grid after each cycle.

To maintain continous boundary condition, an adittional row/column is added in the start and end of the grid.
The grid values are initated based on probability.

The Plotting might not work if the grid size is very large say more than 25, due to the limitations of the function.
However if a single grid is used, N can take values upto 400.
