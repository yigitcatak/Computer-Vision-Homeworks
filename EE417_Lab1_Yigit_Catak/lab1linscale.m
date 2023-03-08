function result = lab1linscale(img)
    
    result = double(img);
    maxval = max(result(:));
    minval = min(result(:));
    
    result = uint8((result-minval).*(255/(maxval-minval)));
end