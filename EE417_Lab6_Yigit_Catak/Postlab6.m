close all; clc;

img = rgb2gray(imread("cal.jpg"));
edged = edge(img,"canny",0.075);
figure
imshow(edged)

[H,T,R] = hough(edged);
P  = houghpeaks(H,30);
lines = houghlines(edged,T,R,P,'FillGap',80,'MinLength',90);

 figure
imshow(imadjust(rescale(H)),'XData',T,'YData',R,'InitialMagnification','fit');
title('Hough transform of the image with found peaks');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','red');

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
