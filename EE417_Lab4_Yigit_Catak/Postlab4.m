close all; clc;

blocks = rgb2gray(imread("blocks.png"));
monastry = imread("Monastry.bmp");
checker = 255*uint8(checkerboard(30));
%%
tic;
[~, coordinates] = lab4Harriscorners2(blocks,50000000000,2);

figure
imshow(blocks)
title('Harris Corners')
hold on
plot(coordinates(:,1),coordinates(:,2),'r.')

[~, coordinates] = lab4Harriscorners2(checker,100000,2);

figure
imshow(checker)
title('Harris Corners')
hold on
plot(coordinates(:,1),coordinates(:,2),'r.')

[~, coordinates] = lab4Harriscorners2(monastry,100000,2);

figure
imshow(monastry)
title('Harris Corners')
hold on
plot(coordinates(:,1),coordinates(:,2),'r.')
toc;