colormap hot(500); 
M = 2*zeros(141,361);

for j = 1:141
    y = -0.7 + (j-1)*.01/2;
    
    for i = 1:361
        x = -1.8 + (i-1)*.01/2;
        c = x + 1i*y;
        [X,kount] = orbit6(0); 
        
        if X == 0
            M(j,i) = (0.95-kount/150)*500
        end
        %x=0 means it diverges 
    end
end

image([-0.7, 0.7], [-1.8, 1.8], M);
axis xy
