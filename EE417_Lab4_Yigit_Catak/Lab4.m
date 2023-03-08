close all; clc;

blocks = rgb2gray(imread("blocks.png"));
monastry = imread("Monastry.bmp");
checker = 255*uint8(checkerboard(30));
%% KT Corners
tic;
[~, coordinates] = lab4ktcorners(blocks,150000,2);

figure
imshow(blocks)
title('KT Corners')
hold on
plot(coordinates(:,2),coordinates(:,1),'r.')

[~, coordinates] = lab4ktcorners(checker,150000,2);

figure
imshow(checker)
title('KT Corners')
hold on
plot(coordinates(:,2),coordinates(:,1),'r.')

[~, coordinates] = lab4ktcorners(monastry,150000,2);

figure
imshow(monastry)
title('KT Corners')
hold on
plot(coordinates(:,2),coordinates(:,1),'r.')
toc;
%% Harris Corners
tic;
[~, coordinates] = lab4Harriscorners(blocks,100000,2);

figure
imshow(blocks)
title('Harris Corners')
hold on
plot(coordinates(:,2),coordinates(:,1),'r.')

[~, coordinates] = lab4Harriscorners(checker,100000,2);

figure
imshow(checker)
title('Harris Corners')
hold on
plot(coordinates(:,2),coordinates(:,1),'r.')

[~, coordinates] = lab4Harriscorners(monastry,100000,2);

figure
imshow(monastry)
title('Harris Corners')
hold on
plot(coordinates(:,2),coordinates(:,1),'r.')
toc;