close all; clc;

peppers = rgb2gray(imread("peppers.png"));
objects = rgb2gray(imread("Object_contours.jpg"));

[vert,horz,edge] = lab3prewitt(peppers,90);
[vert2,horz2,edge2] = lab3sobel(peppers,90);
[logfiltered, logfiltered_double] = lab3log(objects);

figure
subplot(221)
imshow(peppers)
title('Original')
subplot(222)
imshow(horz)
title('Prewitt Horizontal Filtered Image')
subplot(223)
imshow(vert)
title('Prewitt Vertical Filtered Image')
subplot(224)
imshow(edge)
title('Prewitt Vertical Filtered Image')

figure
subplot(221)
imshow(peppers)
title('Original')
subplot(222)
imshow(horz2)
title('Sobel Horizontal Filtered Image')
subplot(223)
imshow(vert2)
title('Sobel Vertical Filtered Image')
subplot(224)
imshow(edge2)
title('Sobel Vertical Filtered Image')

figure
subplot(121)
imshow(objects)
title('Original')
subplot(122)
imshow(logfiltered)
title('Laplacian Filtered Image')

row = logfiltered_double(200,20:100);
pixel_range = 20:100;

figure
plot(pixel_range,row)
ylabel('gradient magnitude')
xlabel('pixel range')

