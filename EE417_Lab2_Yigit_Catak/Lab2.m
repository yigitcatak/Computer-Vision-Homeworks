close all; clc;

jump = imread('jump.png');
tiger = imread('tiger.png');
mother = imread('mother.png');
house = imread('house.png');

tic;
gauss_jump = lab2gaussfilt(jump);
median_3_tiger = lab2medfilt(tiger,3);
gauss_tiger = lab2gaussfilt(tiger);

locbox_1_sharpened_mother = lab2sharpen(mother,1,0);
median_1_sharpened_mother = lab2sharpen(mother,1,1);
gauss_1_sharpened_mother = lab2sharpen(mother,1,2);
locbox_5_sharpened_mother = lab2sharpen(mother,5,0);
median_5_sharpened_mother = lab2sharpen(mother,5,1);
gauss_5_sharpened_mother = lab2sharpen(mother,5,2);
locbox_25_sharpened_mother = lab2sharpen(mother,2.5,0);
median_25_sharpened_mother = lab2sharpen(mother,2.5,1);
gauss_25_sharpened_mother = lab2sharpen(mother,2.5,2);
[vertical_house, horizontal_house] = lab2sobelfit(house);
toc;

figure
subplot(121)
imshow(jump)
title('Original')
subplot(122)
imshow(gauss_jump)
title('Gaussian Filtered Image')

figure
subplot(131)
imshow(tiger)
title('Original')
subplot(132)
imshow(gauss_tiger)
title('Gaussian Filtered Image')
subplot(133)
imshow(median_3_tiger)
title('Median Filtered Image, k=3')

figure
subplot(331)
imshow(locbox_1_sharpened_mother)
title('Locbox sharpened, \lambda = 1')
subplot(332)
imshow(median_1_sharpened_mother)
title('Median sharpened, \lambda = 1')
subplot(333)
imshow(gauss_1_sharpened_mother)
title('Gaussian sharpened, \lambda = 1')
subplot(334)
imshow(locbox_5_sharpened_mother)
title('Locbox sharpened, \lambda = 5')
subplot(335)
imshow(median_5_sharpened_mother)
title('Median sharpened, \lambda = 5')
subplot(336)
imshow(gauss_5_sharpened_mother)
title('Gaussian sharpened, \lambda = 5')
subplot(337)
imshow(locbox_25_sharpened_mother)
title('Locbox sharpened, \lambda = 2.5')
subplot(338)
imshow(median_25_sharpened_mother)
title('Median sharpened, \lambda = 2.5')
subplot(339)
imshow(gauss_25_sharpened_mother)
title('Gaussian sharpened, \lambda = 2.5')

figure
subplot(131)
imshow(house)
title('Original')
subplot(132)
imshow(horizontal_house)
title('Sobel Horizontal Filtered Image')
subplot(133)
imshow(vertical_house)
title('Sobel Vertical Filtered Image')