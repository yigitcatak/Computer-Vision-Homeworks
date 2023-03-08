function hist = myHist(img)
    hist = uint32(zeros(1,255));
    sizes = size(img);
    for i = 1:sizes(1)
        for j = 1:sizes(2)
           hist(img(i,j)+1) = hist(img(i,j)+1) + 1;
        end
    end
end