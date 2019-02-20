function [xvect,err,fx,it] =bisez(a,b,nmax,toll,fun)
it=-1;
xvect=[];
fx=[];
xdif=[];
err=toll+1;
while (it<nmax && err>toll)
   x=(a+b)/2;
   if abs(fun(x))<eps
       err=0;
   else
       err=abs((b-a)/2);
   end
   xdif=[xdif;err];
   xvect=[xvect;x];
   fx=[fx;fun(x)];
   it=it+1;
       if fun(a)*fun(x)<0
           b=x;
       else
           a=x;
       end
end

