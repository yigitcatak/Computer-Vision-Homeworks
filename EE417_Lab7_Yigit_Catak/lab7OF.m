function lab7OF(ImPrev,ImCurr,k,Threshold,filter)
    % Smooth the input images using a Box filter
    % Calculate spatial gradients (Ix, Iy) using Prewitt filter
    % Calculate temporal (It) gradient
    if filter == 0
        M = ones(4)/16;
    else
        M = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1]/273;
    end
    ImCurr2 = conv2(ImCurr,M,'same');
    ImPrev2 = conv2(ImPrev,M,'same');
    X = [1,0,-1;1,0,-1;1,0,-1];
    Y = [1,1,1;0,0,0;-1,-1,-1];
    Gx = conv2(ImCurr2,X,'same');
    Gy = conv2(ImCurr2,Y,'same');
    Gt = ImCurr2-ImPrev2;

    [ydim,xdim] = size(ImCurr);
    Vx = zeros(ydim,xdim);
    Vy = zeros(ydim,xdim);
    G = zeros(2,2);
    
    cx=k+1;
    for x=k+1:k:xdim-k-1
        cy=k+1;
        for y=k+1:k:ydim-k-1
            % Calculate the elements of G and b
            Ix = Gx(y-k:y+k,x-k:x+k);
            Iy = Gy(y-k:y+k,x-k:x+k);
            It = Gt(y-k:y+k,x-k:x+k);

            b = [sum(Ix.*It,'all'); sum(Iy.*It,'all')];
            G(1,1) = sum(Ix.^2,'all');
            G(2,2) = sum(Iy.^2,'all');
            G(1,2) = sum(Ix.*Iy,'all');
            G(2,1) = G(1,2);
            e = eig(G);
            
            if (min(e) < Threshold)
                Vx(cy,cx)=0;
                Vy(cy,cx)=0;
            else
                % Calculate u
                u = -inv(G)*b;
                
                Vx(cy,cx)=u(1);
                Vy(cy,cx)=u(2);
            end
            cy=cy+k;
        end
        cx=cx+k;
    end
    cla reset;
    imagesc(ImPrev); hold on;
    [xramp,yramp] = meshgrid(1:1:xdim,1:1:ydim);
    quiver(xramp,yramp,Vx,Vy,10,'r');
    colormap gray;
end