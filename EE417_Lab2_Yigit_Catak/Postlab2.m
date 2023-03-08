close all; clc;

jump = imread('jump.png');
tiger = imread('tiger.png');

tic;
jump2 = lab2sigma(jump,50,3);
toc;
jump3 = lab2sigma(jump,20,3);
jump4 = lab2sigma(jump,100,3);

tic;
tiger2 = lab2sigma(tiger,50,3);
toc;
tiger3 = lab2sigma(tiger,20,3);
tiger4 = lab2sigma(tiger,100,3);

figure
subplot(221)
imshow(jump)
title('Original')
subplot(222)
imshow(jump2)
title('\sigma = 50, k = 3')
subplot(223)
imshow(jump3)
title('\sigma = 20, k = 3')
subplot(224)
imshow(jump4)
title('\sigma = 100, k = 3')

figure
subplot(221)
imshow(tiger)
title('Original')
subplot(222)
imshow(tiger2)
title('\sigma = 50, k = 3')
subplot(223)
imshow(tiger3)
title('\sigma = 20, k = 3')
subplot(224)
imshow(tiger4)
title('\sigma = 100, k = 3')