function [result, coordinates]= lab4ktcorners(img,thr,k)
    sizes = size(img);
    result = zeros(sizes(1),sizes(2),"uint8");

    img = [zeros(k,sizes(2)); img; zeros(k,sizes(2))];
    img = [zeros(sizes(1)+(2*k),k), img, zeros(sizes(1)+(2*k),k)];
    [Gx,Gy] = imgradientxy(img);

    H = zeros(2,2);
    coordinates = [];
    for i = 1:sizes(1)
        for j = 1:sizes(2)
            % i to i+2k as i skip first k pixels of paddings
            H(1,1) = sum(Gx(i:i+(2*k),j:j+(2*k)).^2,"all");
            H(2,2) = sum(Gy(i:i+(2*k),j:j+(2*k)).^2,"all"); 
            H(1,2) = sum(Gy(i:i+(2*k),j:j+(2*k)).*Gx(i:i+(2*k),j:j+(2*k)),"all");
            H(2,1) = H(1,2);
            e = eig(H);
            if min(e) > thr
                result(i,j) = 255;
                coordinates = [coordinates; i,j];
            end
        end
    end
end