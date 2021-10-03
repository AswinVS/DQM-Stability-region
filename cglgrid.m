function y = cglgrid(xini,xend,N)
    xdur=xend-xini;
    r=zeros(1,N);
    y=r;
     for i = 1:N
          r(i) = 0.5*(1-cos((i-1)*pi/(N-1)));
     end
     for i = 1:N
        y(i) = xdur*(r(i)-r(1))/(r(N)-r(1))+xini;
     end
end