phi = inline ('z^2-0.123-0.745*i')

fixpt1 = -0.276582 - 0.479666*i;
fixpt2 = 1.27658 + 0.479666*i;
colormap([1 0 0; 1 1 1]);
M=2*ones(361,361);

for j=1:361
    y=-2.1 + (j-1)*.01;
  for i = 1:361
     x= -2.1 +(i-1)*.01;
     z= x+ 1i*y;
     zk=z;
     iflag1=0;
     iflag2=0;
     kount=0;
   
       while kount<100 && abs(zk)<2 && iflag1<5 && iflag2<5
       kount=kount+1;
       zk = phi (zk);
    
       err1= abs(zk-fixpt1);
       if err1 < 1.e-6
           iflag1 = iflag1 +1;
       else
            iflag1 = 0;
       end
    
       err2= abs(zk-fixpt2);
       if err2 < 1.e-6
         iflag2 = iflag2 +1;
       else 
        iflag2 = 0;
       end
    
       end 

       if iflag1>= 5 || iflag2>=5 || kount >=100
         M(j,i)=1;
       end
    
  end
end

image ([-2.1 2.1], [-2.1 2.1], M),
axis xy
