function [ outrgb ] = correctrgb( rawrgb, darkrgb, flatrgb )

    outrgb = rawrgb;
    
    [ysize,xsize,channels] = size(rawrgb);
    xmin = 100;
    xmax = xsize - xmin;
    ymin = 100;
    ymax = ysize - ymin;

    for ch = [1,2,3]
%         flatlayer = flatrgb(:,:,ch) - darkrgb(:,:,ch);
%         vmin = min(min(flatlayer(ymin:ymax,xmin:xmax)));
%         vmax = max(max(flatlayer(ymin:ymax,xmin:xmax)));
%         nflatlayer = (flatlayer - vmin) / ( vmax - vmin);
        outrgb(:,:,ch) = (rawrgb(:,:,ch) - darkrgb(:,:,ch)) ./ flatrgb(:,:,ch);
    end
    %CORRECTRGB Summary of this function goes here
    %   Detailed explanation goes here


end

