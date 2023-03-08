close all; clc;
% Load the files given in SUcourse as Seq variable
cars1 = load("cars1.mat").cars1;
cars2 = load("cars2.mat").cars2;
rubic = load("rubic.mat").rubic;
sphere = load("sphere.mat").sphere;
taxi = load("taxi.mat").taxi;
traffic = load("traffic.mat").traffic;

Seq = traffic;
[row,col,num]=size(Seq);
% Define k and Threshold
for j=2:1:num
    ImPrev = Seq(:,:,j-1);
    ImCurr = Seq(:,:,j);
    lab7OF(ImPrev,ImCurr,30,20000,0);
    pause(0.1);
end