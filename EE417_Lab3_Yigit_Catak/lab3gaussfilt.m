function result = lab3gaussfilt(img)
    gf = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1]/273;
    sizes = size(img);
    result = double(zeros(sizes(1),sizes(2)));
    %padding
    img = [zeros(2,sizes(2)); img; zeros(2,sizes(2))];
    img = [zeros(sizes(1)+4,2), img, zeros(sizes(1)+4,2)];
    
    img = double(img);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+4 as i skip first 2 pixels of paddings
            result(i,j) = sum(sum(img(i:i+4,j:j+4).*gf)); 
        end
    end

    result = uint8(result);
end