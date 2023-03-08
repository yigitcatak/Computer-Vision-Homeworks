close all; clc;
%% office.jpg
close all; clc;
office = rgb2gray(imread("office.jpg"));
imshow(office)
title("original image, converted to grayscale")

tic;
prewitt_edge = edge(office,"prewitt");
toc; tic;
canny_edge = edge(office,"canny");
toc; tic;
roberts_edge = edge(office,"roberts");
toc; tic;
log_edge = edge(office,"log");
toc; fprintf("\n");

figure
subplot(221)
imshow(prewitt_edge);
title("prewitt edges, default threshold")
subplot(222)
imshow(canny_edge);
title("canny edges, default threshold")
subplot(223)
imshow(roberts_edge);
title("roberts edges, default threshold")
subplot(224)
imshow(log_edge);
title("log edges, default threshold")

tic;
prewitt_edge2 = edge(office,"prewitt",0.04);
toc; tic;
canny_edge2 = edge(office,"canny",0.07);
toc; tic;
roberts_edge2 = edge(office,"roberts",0.036);
toc; tic;
log_edge2 = edge(office,"log",0.0031);
toc; fprintf("\n");

figure
subplot(121)
imshow(prewitt_edge)
title("default threshold")
subplot(122)
imshow(prewitt_edge2)
title("custom threshold, 0.04")

figure
subplot(121)
imshow(canny_edge)
title("default threshold")
subplot(122)
imshow(canny_edge2)
title("custom threshold, 0.07")

figure
subplot(121)
imshow(roberts_edge)
title("default threshold")
subplot(122)
imshow(roberts_edge2)
title("custom threshold, 0.036")

figure
subplot(121)
imshow(log_edge)
title("default threshold")
subplot(122)
imshow(log_edge2)
title("custom threshold, 0.0031")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic;
ktcorners = detectMinEigenFeatures(office);
toc; fprintf("\n");

figure
imshow(office); hold on
plot(ktcorners.Location(:,1),ktcorners.Location(:,2),'g.')
title("KT Corners")

tic;
harriscorners = detectHarrisFeatures(office);
toc; fprintf("\n");

figure
imshow(office); hold on
plot(harriscorners.Location(:,1),harriscorners.Location(:,2),'g.')
title("Harris Corners")

%% hd.jpg
close all; clc;
hd = rgb2gray(imread("hd.jpg"));
imshow(hd)
title("original image, converted to grayscale")

tic;
prewitt_edge = edge(hd,"prewitt");
toc; tic;
canny_edge = edge(hd,"canny");
toc; tic;
roberts_edge = edge(hd,"roberts");
toc; tic;
log_edge = edge(hd,"log");
toc; fprintf("\n");

figure
subplot(221)
imshow(prewitt_edge);
title("prewitt edges, default threshold")
subplot(222)
imshow(canny_edge);
title("canny edges, default threshold")
subplot(223)
imshow(roberts_edge);
title("roberts edges, default threshold")
subplot(224)
imshow(log_edge);
title("log edges, default threshold")

tic;
prewitt_edge2 = edge(hd,"prewitt",0.04);
toc; tic;
canny_edge2 = edge(hd,"canny",0.07);
toc; tic;
roberts_edge2 = edge(hd,"roberts",0.036);
toc; tic;
log_edge2 = edge(hd,"log",0.0031);
toc; fprintf("\n");

figure
subplot(121)
imshow(prewitt_edge)
title("default threshold")
subplot(122)
imshow(prewitt_edge2)
title("custom threshold, 0.04")

figure
subplot(121)
imshow(canny_edge)
title("default threshold")
subplot(122)
imshow(canny_edge2)
title("custom threshold, 0.07")

figure
subplot(121)
imshow(roberts_edge)
title("default threshold")
subplot(122)
imshow(roberts_edge2)
title("custom threshold, 0.036")

figure
subplot(121)
imshow(log_edge)
title("default threshold")
subplot(122)
imshow(log_edge2)
title("custom threshold, 0.0031")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic;
ktcorners = detectMinEigenFeatures(hd);
toc; fprintf("\n");

figure
imshow(hd); hold on
plot(ktcorners.Location(:,1),ktcorners.Location(:,2),'g.')
title("KT Corners")

tic;
harriscorners = detectHarrisFeatures(hd);
toc; fprintf("\n");

figure
imshow(hd); hold on
plot(harriscorners.Location(:,1),harriscorners.Location(:,2),'g.')
title("Harris Corners")
%% cube.jpg

cube = rgb2gray(imread("cube.jpg"));
imshow(cube)
title("original image, converted to grayscale")

tic;
prewitt_edge = edge(cube,"prewitt");
toc; tic;
canny_edge = edge(cube,"canny");
toc; tic;
roberts_edge = edge(cube,"roberts");
toc; tic;
log_edge = edge(cube,"log");
toc; fprintf("\n");

figure
subplot(221)
imshow(prewitt_edge);
title("prewitt edges, default threshold")
subplot(222)
imshow(canny_edge);
title("canny edges, default threshold")
subplot(223)
imshow(roberts_edge);
title("roberts edges, default threshold")
subplot(224)
imshow(log_edge);
title("log edges, default threshold")

tic;
prewitt_edge2 = edge(cube,"prewitt",0.04);
toc; tic;
canny_edge2 = edge(cube,"canny",0.07);
toc; tic;
roberts_edge2 = edge(cube,"roberts",0.036);
toc; tic;
log_edge2 = edge(cube,"log",0.0031);
toc; fprintf("\n");

figure
subplot(121)
imshow(prewitt_edge)
title("default threshold")
subplot(122)
imshow(prewitt_edge2)
title("custom threshold, 0.04")

figure
subplot(121)
imshow(canny_edge)
title("default threshold")
subplot(122)
imshow(canny_edge2)
title("custom threshold, 0.07")

figure
subplot(121)
imshow(roberts_edge)
title("default threshold")
subplot(122)
imshow(roberts_edge2)
title("custom threshold, 0.036")

figure
subplot(121)
imshow(log_edge)
title("default threshold")
subplot(122)
imshow(log_edge2)
title("custom threshold, 0.0031")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic;
ktcorners = detectMinEigenFeatures(cube);
toc; fprintf("\n");

figure
imshow(cube); hold on
plot(ktcorners.Location(:,1),ktcorners.Location(:,2),'g.')
title("KT Corners")

tic;
harriscorners = detectHarrisFeatures(cube);
toc; fprintf("\n");

figure
imshow(cube); hold on
plot(harriscorners.Location(:,1),harriscorners.Location(:,2),'g.')
title("Harris Corners")