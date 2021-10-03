function[B, B2]=weigcoef(x)
  N=length(x);
  B=zeros(N,N);
   for i=1:N
     for j=1:N-1
        if(j<i)
            Buffer1(j)=(x(i)-x(j));
        else
            Buffer1(j)=(x(i)-x(j+1));
    
        end
     end
     m1(i)=prod(Buffer1);
   end
   for i=1:N
    for j=1:N
        if (i~=j)
            B(i,j)=m1(i)/((x(i)-x(j))*m1(j));
        end
    end
   end
   for i=1:N
      B(i,i)=-sum(B(i,:));
   end
   B2 = B*B;
end