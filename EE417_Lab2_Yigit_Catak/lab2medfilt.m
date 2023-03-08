function result = lab2medfilt(img,k)
    
    sizes = size(img);
    result = double(zeros(sizes(1),sizes(2)));

    img = [zeros(k,sizes(2)); img; zeros(k,sizes(2))];
    img = [zeros(sizes(1)+(2*k),k), img, zeros(sizes(1)+(2*k),k)];

    img = double(img);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+2k as i skip first k pixels of paddings
            result(i,j) = median(img(i:i+(2*k),j:j+(2*k)),'all'); 
        end
    end

    result = uint8(result);
end