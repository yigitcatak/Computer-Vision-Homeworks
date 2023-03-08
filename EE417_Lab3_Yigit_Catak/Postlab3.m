close all; clc;

objects = rgb2gray(imread("Object_contours.jpg"));
[logfiltered, logfiltered_double] = lab3log(objects);

%prc95 = prctile(logfiltered_double,95,'all');
%prc5 = prctile(logfiltered_double,5,'all');
prc95 = 6;
prc5 = -6;

%prc90 = prctile(logfiltered_double,90,'all');
%prc10 = prctile(logfiltered_double,10,'all');
prc90 = 2;
prc10 = -2;

img95 = lab3edge(logfiltered_double,prc95,prc5);
img90 = lab3edge(logfiltered_double,prc90,prc10);

[vert95, horz95, img95_2]= lab3edge_alternate(logfiltered_double,prc95,prc5);
[vert90, horz90, img90_2]= lab3edge_alternate(logfiltered_double,prc90,prc10);

figure
subplot(221)
imshow(objects)
title('Original')
subplot(222)
imshow(logfiltered)
title('logfiltered Filtered Image')
subplot(223)
imshow(img90)
title('90th percentile edge detection')
subplot(224)
imshow(img95)
title('95th percentile edge detection')

figure
subplot(131)
imshow(vert95)
title('95th percentile, vert')
subplot(132)
imshow(horz95)
title('95th percentile, horz')
subplot(133)
imshow(img95_2)
title('95th percentile, total')

figure
subplot(131)
imshow(vert90)
title('90th percentile, vert')
subplot(132)
imshow(horz90)
title('90th percentile, horz')
subplot(133)
imshow(img90_2)
title('90th percentile, total')