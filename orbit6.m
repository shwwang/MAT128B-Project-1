function [x,kount] = orbit6(z)

phi=inline('z.^2 -1.25');
fxpt1 =  -0.724745;
fxpt2 =  1.72474;

zk = z;
iflag1 = 0;
iflag2 = 0;
kount = 0;

while kount < 100 && abs(zk)<= 100 && iflag1<5 && iflag2< 5
    kount =kount +1;
    zk=phi(zk);
    
    err1=abs(zk-fxpt1);
    if err1 < 10^(-6), iflag1=iflag1+1; else,iflag1=0;end;
    
    err2=abs(zk-fxpt2);
    if err2 < 10^(-6),iflag2=iflag2+1; else,iflag2=0;end;
    
end

if iflag1 >= 5 ||iflag2>=5
   x = 1;
   
elseif abs(zk)>100
   x = 0;

else
   x = 1;
   
end
end
