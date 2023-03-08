function result = lab3edge(logimg,thr,negthr)
    sizes = size(logimg);
    result = uint8(zeros(sizes(1),sizes(2)));
    
    for i = 1:sizes(1)
        for j = 1:sizes(2)
            if (logimg(i,j) > thr) | (logimg(i,j) < negthr)
                result(i,j) = 255;
            end            
        end
    end
end