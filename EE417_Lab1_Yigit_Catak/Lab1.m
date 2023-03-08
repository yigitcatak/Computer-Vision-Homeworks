close all; clc;
city = imread('city.png');
board = rgb2gray(imread('board.jpg'));
jump = imread('jump.png');
current = imread('currentImage.png');

[maxcurrent, mincurrent] = lab1locmaxmin(current,3);
[maxcurrent2, mincurrent2] = lab1locmaxmin(current,3);
histequalized_city = histeq(city);
linscaled_image = lab1linscale(city);
condscaled_image = lab1condscale(city,board);
locbox_image = lab1locbox(jump,5);
locbox_image2 = lab1locbox(jump,10);
locbox_image3 = lab1locbox(jump,2);

figure
subplot(221)
imshow(city)
title('Original')
subplot(222)
imshow(histequalized_city)
title('Histogram Equalized Image')
subplot(223)
imhist(city)
title('Histogram of the Original image')
subplot(224)
imhist(histequalized_city)
title('Histogram of the Histogram Equalized image')

figure
subplot(221)
imshow(city)
title('Original')
subplot(222)
imshow(linscaled_image)
title('Lineraly Scaled Image')
subplot(223)
imhist(city)
title('Histogram of the Original Image')
subplot(224)
imhist(linscaled_image)
title('Hisogram of the Linearly Scaled image')

figure
subplot(221)
imshow(city)
title('Original')
subplot(222)
imshow(condscaled_image)
title('Conditionally Scaled Image')
subplot(223)
imhist(city)
title('Histogram of the Original Image')
subplot(224)
imhist(condscaled_image)
title('Hisogram of the Conditionally Scaled image')

text11 = ['mean of the original image is: ', num2str(mean(city,'all'))];
text12 = ['std of the original image is: ', num2str(std(double(city),0,'all'))];
text21 = ['mean of the reference image is: ', num2str(mean(board,'all'))];
text22 = ['std of the reference image is: ', num2str(std(double(board),0,'all'))];
text31 = ['mean of the original image is: ', num2str(mean(condscaled_image,'all'))];
text32 = ['std of the original image is: ', num2str(std(double(condscaled_image),0,'all'))];
disp(text11)
disp(text12)
disp(text21)
disp(text22)
disp(text31)
disp(text32)

figure
subplot(221)
imshow(jump)
title('Original')
subplot(222)
imshow(locbox_image)
title('Running Window Average Filtered Image, k=5')
subplot(223)
imshow(locbox_image2)
title('Running Window Average Filtered Image, k=2')
subplot(224)
imshow(locbox_image3)
title('Running Window Average Filtered Image, k=10')

figure
subplot(231)
imshow(current)
title('Original')
subplot(232)
imshow(maxcurrent)
title('Local Max Filtered Image, k=3')
subplot(233)
imshow(mincurrent)
title('Local Min Filtered Image, k=3')
subplot(234)
imshow(current)
title('Original')
subplot(235)
imshow(maxcurrent2)
title('Local Max Filtered Image, k=7')
subplot(236)
imshow(mincurrent2)
title('Local Min Filtered Image, k=7')