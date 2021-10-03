clc; clear;                     % clearing the command window and workspace
syms H t                        % Creating the symbolic variables H and t
N = 30;                        % Number of points in theta
q = linspace(eps,2*pi-eps,N);   % 0<theta<2pi
z = exp(1i*q);                  % exp(i theta)
M = 6;                     % Number of grid points along temporal direction
cgl = 1;      % 1 for using Chebysehev-Gauss-Lobatto and 0 for uniform grid
x = cgl*cglgrid(0,1,M)+(1-cgl)*linspace(0,1,M); % M discrete points in time
[A,~] = weigcoef(x);             % Computing the DQM weighting coefficients
B = [zeros(M-1,M-2), A(2:M,1)];  % [0 A_21] matrix
V = det((A(2:end,2:end)-H*diag(ones(1,M-1)))*t-B);% Characteristic polynomial
s = zeros(N,M-1);               % Initilize the matrix to store roots of H

for p = 1:N                     % for loop for each point in theta
    t = z(p);                   % giving the value for t
    Vt = subs(V);               % substituting the value of t in the chara.
    c = vpa(solve(Vt,H));       % soling chara. for roots of H
    s(p,:) = c';                % collecting the roots for plotting
end                             % end of the loop

plot(s,'*r')                    % plotting the roots of H
pbaspect([1 1 1])
xlabel('Re(\lambdaT)'), ylabel('Im(\lambdaT)');


