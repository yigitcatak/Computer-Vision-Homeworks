function result = myHisteq(img)
    hist = imhist(img);
    sizes = size(img);
    result = uint8(zeros(sizes(1),sizes(2)));
    n = sizes(1) * sizes(2);
    phist = double(hist)/n;
    cumulative_hist = double(zeros(1,255));
    cumulative_hist(1) = phist(1);
    for i = 2:255
        cumulative_hist(i) = phist(i) + cumulative_hist(i-1);
    end
    cumulative_hist = uint8(cumulative_hist*255);

    for i = 1:sizes(1)
        for j = 1:sizes(2)
            result(i,j) = cumulative_hist(img(i,j));
        end
    end
end