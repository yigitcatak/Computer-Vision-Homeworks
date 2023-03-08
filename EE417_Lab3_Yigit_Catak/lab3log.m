function [result, result_double] = lab3log(img)
    K = [0,1,0;1,-4,1;0,1,0];

    img = lab3gaussfilt(img);

    sizes = size(img);
    result = double(zeros(sizes(1),sizes(2)));

    %padding
    img = [zeros(2,sizes(2)); img; zeros(2,sizes(2))];
    img = [zeros(sizes(1)+4,2), img, zeros(sizes(1)+4,2)];
    
    img = double(img);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+2 as i skip first 1 pixels of paddings
            result(i,j) = sum(sum(img(i:i+2,j:j+2).*K));            
            
        end
    end
    result_double = result;
    result = uint8(result);
    
end