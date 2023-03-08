function lab5houghlines(result,checker,fillgap,minlength)
    tic;
    [H,T,R] = hough(result,'RhoResolution',0.5,'Theta',-90:0.5:89);
    P  = houghpeaks(H,20);
    lines = houghlines(result,T,R,P,'FillGap',fillgap,'MinLength',minlength);
    x = toc;
    text = ["Elapsed time for Hough Transformation and the line detection is " + num2str(x) + " seconds."]; disp(text);
    
    % Hough Transformation
    figure
    imshow(imadjust(rescale(H)),'XData',T,'YData',R,'InitialMagnification','fit');
    title('Hough transform of the image with found peaks');
    xlabel('\theta'), ylabel('\rho');
    axis on, axis normal, hold on;
    plot(T(P(:,2)),R(P(:,1)),'s','color','red');

    % The Lines
    figure, imshow(checker), hold on
    title('Lines found in the image')
    max_len = 0;
    min_len = max(size(checker));
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
       % Plot beginnings and ends of lines
       plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
       plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
       % Determine the endpoints of the longest line segment
       len = norm(lines(k).point1 - lines(k).point2);
       if len > max_len
          max_len = len;
          xy_long = xy;
       end
       if len < min_len
          min_len = len;
          xy_short = xy;
       end
    end
    plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
    plot(xy_short(:,1),xy_short(:,2),'LineWidth',2,'Color','red');
end