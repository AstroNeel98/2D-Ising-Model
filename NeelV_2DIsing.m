%Code for 2-D Ising Model
N = 100;
KT = 1;
t = 50000;
E = zeros(1,t);
Et = 0;
GH=[];
% Setting up the grid 
G = ones(N+2,N+2);
for i = 2:(N+1)
    for j = 2:(N+1)
        if rand < 0.49  
            G(i,j) = -1;
        end
    end
end

%Continues Boundary Condition
for i = 1:N
    G(i,1) = G(i,N+1);
    G(i,N+2) = G(i,2);
    G(1,i) = G(N+1,i);
    G(N+2,i) = G(2,i);
end
%Calculating the Eenrgy of the system
for k = 1:t
    %fprintf('\nbefore flip\n');
    %disp(G);
 for i = 2:N+1
    for j = 2:N+1
    E(k) = E(k) + (1/2)*G(i,j)*(G(i,j-1) + G(i,j+1) + G(i+1,j) + G(i-1,j));
    end
 end
    E(k) = E(k)*(-1);
%Implementing metropolis algortitm

   
    i = 1 + ceil(N*rand());   
    j = 1 + ceil(N*rand());
    G(i,j) = -G(i,j);
    if(i == 2)
        G(N+2, j) = G(i,j);
    end
    if(i == N+1)
	    G(1, j) = G(i,j);
    end
    if(j == 2)
	    G(i, N+2) = G(i,j);
    end
    if(j == N+1)
	    G(i, 1) = G(i,j);
    end
	
    Et = 0;
    for l = 2:N+1
    for p = 2:N+1
      Et = Et + (1/2)*G(l,p)*(G(l,p-1) + G(l,p+1) + G(l+1,p) + G(l-1,p));
    end
    end
    
   Et = (-1)*Et;
    dE = E(k) - Et;
    GH(k,:,:) = G;
     %fprintf('%i %i\n', i,j);
     %fprintf('after flip\n');
     %disp(G);
    % fprintf('Ek: %i, Et: %i, dE:%i', E(k),Et, dE);
    A(k,:) = [E(k), Et, dE];
    if dE < 0
        R = rand();
      %  fprintf(' R=%f\n',R);
        if R < exp(dE/KT)
            G(i,j) = G(i,j);
        else
            G(i,j) = -G(i,j);
	        if(i == 2)
                G(N+2, j) = G(i,j);
            end
            if(i == N+1)
    	         G(1, j) = G(i,j);
            end
            if(j == 2)
    	        G(i, N+2) = G(i,j);
            end
            if(j == N+1)
    	        G(i, 1) = G(i,j);
            end
        end
    end
	
    pcolor(G)
    colormap(gray(2))
     axis ij
    axis square
    title("Time step: " + k)
    pause(0)
    
end
%Plotting
  tiledlayout(3,3)
  ax1 = nexttile;
  pcolor(squeeze(GH(1,:,:)))
  colormap(gray(2))
  title('Time Step = 1')
  
  ax2 = nexttile;
  pcolor(squeeze(GH(5000,:,:)))
  colormap(gray(2))
  title('Time Step = 5000')
  
  ax3 = nexttile;
  pcolor(squeeze(GH(10000,:,:)))
  colormap(gray(2))
  title('Time Step = 10000')
  
  ax4 = nexttile;
  pcolor(squeeze(GH(15000,:,:)))
  colormap(gray(2))
  title('Time Step = 15000')
  
  ax5 = nexttile;
  pcolor(squeeze(GH(20000,:,:)))
  colormap(gray(2))
  title('Time Step = 20000')
  
   ax6 = nexttile;
  pcolor(squeeze(GH(25000,:,:)))
  colormap(gray(2))
  title('Time Step = 25000')
  
  ax7 = nexttile;
  pcolor(squeeze(GH(30000,:,:)))
  colormap(gray(2))
  title('Time Step = 30000')
  
  ax8 = nexttile;
  pcolor(squeeze(GH(35000,:,:)))
  colormap(gray(2))
  title('Time Step = 35000')
  
  ax9 = nexttile;
  plot(E)
  grid ON
 title("Energy vs Time Step")
 xlabel('Time Step')
 ylabel('Energy')
  
 