close all; clc;
city = imread('city.png');
jump = imread('jump.png');
current = imread('currentImage.png');

original_hist = imhist(city);
my_hist = myHist(city);
original_hist2 = imhist(current);
my_hist2 = myHist(current);

city2 = myHisteq(city);
city3 = histeq(city);

figure
subplot(221)
plot(original_hist)
title('Plot of Original Histogram, city img')
subplot(222)
plot(my_hist)
title('Plot of My Histogram, city img')
subplot(223)
plot(original_hist2)
title('Plot of Original Histogram, current img')
subplot(224)
plot(my_hist2)
title('Plot of My Histogram, current img')

figure
subplot(231)
imshow(city)
title('Original city img')
subplot(232)
imshow(city2)
title('myHisteq city img')
subplot(233)
imshow(city3)
title('builtin histeq current img')
subplot(234)
imhist(city)
title('Original city histogram')
subplot(235)
imhist(city2)
title('myHisteq city histogram')
subplot(236)
imhist(city3)
title('builtin histeq current histogram')