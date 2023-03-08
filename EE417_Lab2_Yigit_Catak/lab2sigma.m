function result = lab2sigma(img,sigma,k)

    sizes = size(img);
    result = double(zeros(sizes(1),sizes(2)));

    img = [zeros(k,sizes(2)); img; zeros(k,sizes(2))];
    img = [zeros(sizes(1)+(2*k),k), img, zeros(sizes(1)+(2*k),k)];

    img = double(img);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+2k as i skip first k pixels of paddings
            window = img(i:i+(2*k),j:j+(2*k));
            hist = imhist(uint8(window)); % if this is done without uint everything is either 0 or 255
            
            sum = 0;
            px_count = 0;
            % take the required part of the histogram
            % if sigma offset exceeds the 0-255 boundary, pick 0/255
            for ii = max(1,img(i+k,j+k)-sigma):min(256,img(i+k,j+k)+sigma)
                sum = sum + hist(ii)*(ii-1);
                px_count = px_count + hist(ii);
            end

            result(i,j) = sum/px_count;
        end
    end
    result = uint8(result);
end