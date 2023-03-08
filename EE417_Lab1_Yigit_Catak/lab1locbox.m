function result = lab1locbox(img,k)
    img = double(img);
    sizes = size(img);
    for i = 1+k:sizes(1)-k
        for j = 1+k:sizes(2)-k
            temp = double(0);
            for m = -k:k % I am aware this is unnecessary, using array indexing and mean is enough
                for n = -k:k
                    temp = temp+(img(i+m,j+n)/(2*k+1)^2);
                end
            end
            result(i,j) = uint8(temp);
        end
    end
end