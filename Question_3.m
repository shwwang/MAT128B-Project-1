c = 0.36+0.1*1i;
hold on;

%colormap([1 0 0; 1 1 1]);

for j=1:361
    y=-1.8 + (j-1)*.01;
  for i = 1:361
     x= -1.8+(i-1)*.01;
     z= x+ 1i*y;
     zk=z;
     kount=0;
     
     
     while kount < 100
         kount = kount +1;
         realdif=real(zk)-real(c);
         imagdif=imag(zk)-imag(c);
         
         r= sqrt(realdif^2 + imagdif^2);
         
         if realdif >0
             theta = atan(imagdif/realdif);
         elseif realdif < 0
             theta = atan(imagdif/realdif) + pi;
         
         end
          
         random_value = randi(2);
         if rem(random_value,2) == 0
             random_value =-1;
         else
             random_value =1;
         end 
         
         zk= random_value * sqrt(r)* (cos(theta/2) + 1i * sin(theta/2));
         
          

     
     end 
     
     plot(real(zk),imag(zk),'.'); 
  end
  
end

hold off;