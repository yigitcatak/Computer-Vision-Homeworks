function lab5houghcircles(img)
    tic;
    [centers, radii] = imfindcircles(img, [20 60]);
    [centers2, radii2] = imfindcircles(img, [20 60],"ObjectPolarity","dark");
    [centers3, radii3] = imfindcircles(img, [20 60],"Sensitivity",0.9);
    x = toc;
    text = ["Elapsed time for circle detection is " + num2str(x) + " seconds."]; disp(text);

    figure
    imshow(img)
    title('Circle detected image with default sensitivity')
    hold on
    viscircles(centers, radii,'EdgeColor','g');
    viscircles(centers2, radii2,'EdgeColor','g');

    c = ismember(floor(centers3),floor(centers));
    for i=1:length(centers3)
        if c(i) == 0
            viscircles(centers3(i,:), radii3(i),'EdgeColor','r');
        end
    end 
end