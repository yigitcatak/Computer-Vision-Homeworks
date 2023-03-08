function result = lab2sharpen(img, lambda, M)

    switch M
        case 0
            S = double(lab2locbox(img,5));
        case 1
            S = double(lab2medfilt(img,5));
        case 2
            S = double(lab2gaussfilt(img));
    end
    
    img = double(img);
    result = img + lambda*(img-S);
    result = uint8(result);
end