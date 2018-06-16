Exposures = readtable('doc/exposures.txt');

imin = 5;
imax = 14
for i=imin:imax
    name = Exposures{i:i,{'File'}}
    x1 = Exposures{i:i,{'x0'}};
    y1 = Exposures{i:i,{'y0'}};
    filename = strjoin(strcat('/Users/Micha/data/20160719_pacman/dng/', name, '.dng'));
    img_lin_rgb = readdng(filename);
    if i == imin
        background = img_lin_rgb;
        compare = background;
        [xmax, ymax, channels] = size(background);
        x0 = x1;
        y0 = y1;
        Values = zeros(imax-imin,10)
    else
        xd = (x0 - x1);
        yd = (y0 - y1);
        compare = compare + img_lin_rgb;
      
        if x0 < x1            
            %size(background(1:end-abs(xd), : , :))
            %size(img_lin_rgb(abs(xd):end-1, :, :))
            if yd < 0
                background(1:end-abs(yd), 1:end-abs(xd), :) = background(1:end-abs(yd), 1:end-abs(xd), :) + img_lin_rgb(abs(yd):end-1, abs(xd):end-1, :);
            elseif yd == 0
                Values(i-imin,:) = [1,x0,x1,xd,1,xmax-abs(xd),xmax-abs(xd)-1,abs(xd)+1,xmax,xmax-abs(xd)-1]
                background(:, 1:end-abs(xd), :) = background(:, 1:end-abs(xd), :) + img_lin_rgb(:, abs(xd)+1:end, :);
            else
                background(abs(yd):end-1, 1:end-abs(xd), :) = background(abs(yd):end-1, 1:end-abs(xd), :) + img_lin_rgb(1:end-abs(yd), abs(xd):end-1,  :);
            end
        elseif x0 == x1
            if yd < 0
                background(1:end-abs(yd), :, :) = background(1:end-abs(yd), :, :) + img_lin_rgb(abs(yd):end-1, :, :);
            elseif yd == 0
                Values(i-imin,:) = [2,x0,x1,xd,1,xmax,xmax-1,1,xmax,xmax-1]
                background = background + img_lin_rgb;
            else
                background(abs(yd):end-1, :, :) = background(abs(yd):end-1, :, :) + img_lin_rgb(1:end-abs(yd), :, :);
            end
        else  % xd > 0, also x0 > x1
            %size(background(abs(xd):end-1,:,:))
            %size(img_in_rgb(1:end-abs(xd),:,:))
            if yd < 0
                background(1:end-abs(yd), abs(xd)+1:end, :) = background(1:end-abs(yd), abs(xd):end-1, :) + img_lin_rgb(abs(yd):end-1, 1:end-abs(xd), :);
            elseif yd == 0
                Values(i-imin,:) = [3,x0,x1,xd,abs(xd),xmax-1,(xmax-1)-abs(xd),1, xmax-abs(xd),xmax-abs(xd)-1]
                background(:, abs(xd)+1:end, :) = background(:, abs(xd)+1:end, :) + img_lin_rgb(:, 1:end-abs(xd), :);
            else
                background(abs(yd):end-1, abs(xd):end-1, :) = background(abs(yd):end-1, abs(xd):end-1, :) + img_lin_rgb(1:end-abs(yd), 1:end-abs(xd), :);
            end
            
        end
    end
end
image(background)