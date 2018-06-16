function [ xoffset, yoffset ] = getOffset( moving, fixed )
    %IMSHIFT 
    %   shift an image by dx and dy
    %   undefined pixel are set to 0
    
    %dx = int16(tform.T(3,1)); % or dy
    %dy = int16(tform.T(3,2)); % or dx
    
    c = normxcorr2(fixed, moving);
    %figure()
    %imagesc(c)
    [ypeak, xpeak] = find(c == max(c(:)));
    [ysize,xsize] = size(moving);
    yoffset = ypeak - ysize;
    xoffset = xpeak - xsize;