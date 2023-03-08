close all; clc;

img = rgb2gray(imread("calibrationObject.png"));
edged = edge(img,"canny",0.085);

[H,T,R] = hough(edged); %'RhoResolution',0.5,'Theta',-90:0.5:89);
P  = houghpeaks(H,35);
lines = houghlines(edged,T,R,P,'FillGap',20,'MinLength',10);
[~, coordinates] = lab4Harriscorners(img,100000,2);

% The Lines
figure
subplot(121)
imshow(img), hold on
title('Lines found in the image')
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
subplot(122)
imshow(img), hold on
title('Lines found in the image')
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
% Plot harris corners on the image
plot(coordinates(:,2),coordinates(:,1),'b.')

%%
% start: 185 228 end: 316 129
% start: 215 121 end: 231 348
line1 = [185,228;316,129];
line2 = [215,121;231,348];

for i=1:length(lines)
    if (lines(i).point1(1) == 185) & (lines(i).point1(2) == 228)
        rho1 = lines(i).rho;
        theta1 = lines(i).theta;
    elseif (lines(i).point1(1) == 215) & (lines(i).point1(2) == 121)
        rho2 = lines(i).rho;
        theta2 = lines(i).theta;
    end
end

coeffs = [cos(deg2rad(theta1)) sin(deg2rad(theta1)); cos(deg2rad(theta2)) sin(deg2rad(theta2))];
rhos = [rho1; rho2];

sol = inv(coeffs)*rhos;

figure
imshow(img), hold on
plot(line1(:,1),line1(:,2),'magenta')
plot(line2(:,1),line2(:,2),'magenta')
scatter(sol(1),sol(2),'gx');