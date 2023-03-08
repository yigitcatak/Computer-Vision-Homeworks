function [maxresult, minresult] = lab1locmaxmin(img,k)
    sizes = size(img);
    maxresult = uint8(zeros(sizes(1),sizes(2)));
    minresult = uint8(zeros(sizes(1),sizes(2)));
    for i = 1+k:sizes(1)-k
        for j = 1+k:sizes(2)-k
            maxresult(i,j) = max(max(img(i-k:i+k,j-k:j+k)));
            minresult(i,j) = min(min(img(i-k:i+k,j-k:j+k)));
        end
    end
end