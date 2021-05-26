#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void main ()
{ int y[100],grid[100][102],i,size,j, J = 0.0025,E,Ef,dE,p,r;

//first we create a 100x100 grid with spins -1 and 1
for(j=0;j<100;j++)
{
  for(i=1;i<101;i++)
{
  y[i] = rand()%2; //Gives Random values between 0 and 1.
    if (y[i] == 0)
    {
      grid[j][i] = -1;
    }
    else
    {
        grid[j][i] = 1;
    }
}
} //Applying Continues boundary condition

for(i=0;i<101;i++)
{
    grid[i][0] = grid[i][1];
    grid[i][101] = grid[i][100];
}

// Now we try to calculate the energy of the particles
for(j=0;j<100;j++)
{
  for(i=1;i<101;i++)
   {
       E = E +  (1/2)*(grid[j-1][i] + grid[j+1][i] + grid[i+1][j] + grid[i-1][j]);
   }
}
printf("The Energy of the system is %d",E);


//Code to display the grid

for(i=0;i<101;i++)
{
    for(j=0;j<100;j++)
    {
        printf("%d \t",grid[j][i]);
    }
}


//Using the Metropolis Algorithm
for(j=0;j<100;j++)
{
  for(i=1;i<101;i++)
   {
       grid[i][j] = -grid[i][j];
       Ef = Ef +  (1/2)*(grid[j-1][i] + grid[j+1][i] + grid[i+1][j] + grid[i-1][j]);
       dE = E - Ef;
   }

}
printf("The difference in the energy is %d \t", dE);
if(dE<0)
{
    p = exp(-dE);
    r=(double)rand()/RAND_MAX;

    if (r<p)
    {
        grid[i][j] = -grid[i][j];
    }
    else
    {
        grid[i][j] = grid[i][j];
    }
}
else
{
    grid[i][j] = grid[i][j];
}
}
