function [vert,horz]= lab2sobelfit(img)
    x = [-1,0,1;-2,0,2;-1,0,1];
    y = [1,2,1;0,0,0;-1,-2,-1];
    sizes = size(img);
    vert = double(zeros(sizes(1),sizes(2)));
    horz = double(zeros(sizes(1),sizes(2)));

    %padding
    img = [zeros(2,sizes(2)); img; zeros(2,sizes(2))];
    img = [zeros(sizes(1)+4,2), img, zeros(sizes(1)+4,2)];
    
    img = double(img);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+2 as i skip first 1 pixels of paddings
            vert(i,j) = sum(sum(img(i:i+2,j:j+2).*x)); 
            horz(i,j) = sum(sum(img(i:i+2,j:j+2).*y)); 
        end
    end

    vert = uint8(vert);
    horz = uint8(horz);
end