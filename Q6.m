colormap hot(500);
%not yey finished
M = zeros(801,801);

for j = 1:801
    y = -2 + (j-1)*.01/2;
    
    for i = 1:801
        x = -2 + (i-1)*.01/2;
        c = x + 1i*y;
        [X,kount] = orbit6(0); 
        
        if X == 0
            M(j,i) = (0.95-kount/150)*500
        end
        %x=0 means it diverges 
    end
end

image([-2, 2], [-2, 2], M);
axis xy
