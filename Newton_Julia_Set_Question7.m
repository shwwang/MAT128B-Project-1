f = inline('z^4-1');                   
fprime = inline('4*z^3');
root1 = 1;                   
root2 = -1;
root3 = 1i;
root4 = -1*1i

colormap([1 0 0;1 0 1;0 1 0; 0 0 1; 1 1 1]);  
                                        
M = 5*ones(361,361);                   

for j=1:361           
  y = -1.8 + (j-1)*.01;   
  for i=1:361         
    x = -1.8 + (i-1)*.01; 
    z = x + 1i*y;
    zk = z;
    kount = 0;          
    err1 = 0;          
    err2 = 0;          
    err3 = 0;
    err4 = 0;

    while kount < 100 && err1 < 10 && err2 < 10 && err3 < 10 && err4 < 10 
      kount = kount + 1;
      zk = zk - f(zk)/fprime(zk);    
      if abs(zk-root1) < 1.e-6      
         err1 = err1 + 1;
      else
         err1 = 0;
      end
      if abs(zk-root2) < 1.e-6      
         err2 = err2 + 1;
      else
         err2 = 0;
      end
      if abs(zk-root3) < 1.e-6      
         err3 = err3 + 1;
      else
         err3 = 0;
      end
      if abs(zk-root4) < 1.e-6      
         err4 = err4 + 1;
      else
         err4 = 0;
      end
    end

    if err1 >=10 
        M(j,i) = 1; 
    end  
   
    if err2 >=10
        M(j,i) = 2; 
    end  
    
    if err3 >=10
        M(j,i) = 3;
    end   
    if err4 >=10
        M(j,i) = 4;
    end  

  end
end

image([-1.8 1.8],[-1.8 1.8],M),        
axis xy                        
