close all; clc;

checker = rgb2gray(imread("checker.jpg"));
circles = imread('circlesBrightDark.png');

result = edge(checker,'log',0.00165);

lab5houghlines(result,checker,5,10);

lab5houghcircles(circles)