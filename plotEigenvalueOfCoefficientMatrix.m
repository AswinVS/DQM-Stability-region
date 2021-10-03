clc; clear;                     % Clearing the command window and workspace
M = 21;                         % Number of grid points along x direction
Al = [1 0; 0 1];                % the matrix alpha ( as per problem)
Be = [ 1 2; -1 4];              % the matrix beta (as per problem)
%%%%%%%%%%%%%%%%% Compute the weighting coefficients %%%%%%%%%%%%%%%%%%%%%

%%% for differential quadrature method
% x = cglgrid(0,1,M);     
% [~,B2] = weigcoef(x); 

%%% for central difference method
x = linspace(0,1,M);
dx = abs(x(2)-x(1));
B2 = (1/dx^2)*(diag(ones(1,M-1),-1)-2*diag(ones(1,M))+diag(ones(1,M-1),1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = kron(B2(2:end-1,2:end-1),Al)+kron(eye(M-2),Be); % A matrix
c = eig(B);                     % Computing the eigenvalues of A
plot(complex(c),'*r')           % plotting the eigenvalues
xlabel('Re(\lambda)'), ylabel('Im(\lambda)');


