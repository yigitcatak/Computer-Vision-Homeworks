function [vert,horz,edge]= lab3sobel(img,t)
    X = [-1,0,1;-2,0,2;-1,0,1];
    Y = [1,2,1;0,0,0;-1,-2,-1];
    sizes = size(img);
    vert = double(zeros(sizes(1),sizes(2)));
    horz = double(zeros(sizes(1),sizes(2)));
    edge = double(zeros(sizes(1),sizes(2)));

    %padding
    img = [zeros(2,sizes(2)); img; zeros(2,sizes(2))];
    img = [zeros(sizes(1)+4,2), img, zeros(sizes(1)+4,2)];
    
    img = double(img);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+2 as i skip first 1 pixels of paddings
            x = sum(sum(img(i:i+2,j:j+2).*X)); 
            y = sum(sum(img(i:i+2,j:j+2).*Y));
            value = sqrt((x^2)+(y^2));

            vert(i,j) = x;
            horz(i,j) = y;
            
            if value > t
                value = 255;
            else
                value = 0;
            end
            
            edge(i,j) = value;
        end
    end

    vert = uint8(vert);
    horz = uint8(horz);
    edge = uint8(edge);
end