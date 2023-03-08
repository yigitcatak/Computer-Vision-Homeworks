function result = lab1condscale(img1,img2)
    img1 = double(img1);
    img2 = double(img2);
    mean1 = mean(img1,'all');
    mean2 = mean(img2,'all');
    std1 = std(img1,0,'all');
    std2 = std(img2,0,'all');
    
    result = uint8((std2/std1).*(img1 + (mean2*(std1/std2) - mean1)));
end