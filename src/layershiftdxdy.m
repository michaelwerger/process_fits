function [ outlayer ] = layershiftdxdy( inlayer, dx, dy )
    %IMSHIFT 
    %   shift an image by dx and dy
    %   undefined pixel are set to 0
    
    %dx = int16(tform.T(3,1)); % or dy
    %dy = int16(tform.T(3,2)); % or dx
    
    outlayer = inlayer * 0; % have same size result
    
    [ysize,xsize] = size(inlayer);

    if (dx < 0)  
        if (dy < 0)
            disp([1 1 dx dy])
            %outlayer(1+abs(dy):ysize,1:xsize-abs(dx)) = outlayer(1+abs(dy):ysize,1:xsize-abs(dx)) + inlayer(1:ysize-abs(dy),1+abs(dx):xsize);
            outlayer(1+abs(dy):ysize,1+abs(dx):xsize) = outlayer(1+abs(dy):ysize,1+abs(dx):xsize) + inlayer(1:ysize-abs(dy),1:xsize-abs(dx));
        elseif (dy > 0)
            disp([1 2 dx dy])
            outlayer(1:ysize-dy,     1+abs(dx):xsize) = outlayer(1:ysize-dy,     1+abs(dx):xsize) + inlayer(1+dy:ysize,1:xsize-abs(dx));
        else
            disp([1 3 dx dy])
            outlayer(:,              1+abs(dx):xsize) = outlayer(:,              1+abs(dx):xsize) + inlayer(:,              1:xsize-abs(dx));
        end
    elseif (dx > 0)
        if (dy < 0)
            disp([2 1 dx dy])
            %outlayer(1+abs(dy):ysize,1+dx:xsize)      = outlayer(1+abs(dy):ysize,1+dx:xsize)      + inlayer(1:ysize-abs(dy),1:xsize-dx);
            outlayer(1+abs(dy):ysize,1:xsize-dx)      = outlayer(1+abs(dy):ysize,1:xsize-dx)      + inlayer(1:ysize-abs(dy),1+dx:xsize);
        elseif (dy > 0)            
            disp([2 2 dx dy])
            outlayer(1:ysize-dy,     1:xsize-dx)      = outlayer(1:ysize-dy,1:xsize-dx)           + inlayer(1+dy:ysize,1+dx:xsize);
        else
            disp([2 3 dx dy])
            outlayer(:,              1:xsize-dx)      = outlayer(:,         1:xsize-dx)           + inlayer(:,         1+dx:xsize);
        end
    else  % dx = 0
        if (dy < 0)
            disp([3 1 dx dy])
            outlayer(1+abs(dy):ysize,:)               = outlayer(1+abs(dy):ysize,:)               + inlayer(1:ysize-abs(dy),:);
        elseif (dy > 0)
            disp([3 2 dx dy])
            outlayer(1:ysize-dy,:)                    = outlayer(1:ysize-dy,:)                    + inlayer(1+dy:ysize,:);
        else
            disp([3 3 dx dy])
           outlayer                                   = inlayer; 
        end
    end
    
end

