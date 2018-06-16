function [ bayer ] = reducebayer( src, tmp, flat, dark, x1, y1, x0, y0 )

xsize = 5568
ysize = 3708

tmpr = ( tmp - dark ) / flat;
if (x0 > x1) && (y1 > y0 )
    diffx = x0 - x1;  
    diffy = y1 - y0;
    src(1:ysize-diffy,diffx+1:xsize) = src(1:ysize-diffy,diffx+1:xsize) + tmp(diffy+1:ysize,1:xsize-diffx);
elseif (x1 > x0)
    diffx = x1 - x0  
    diffy = y1 - y0
    src(1:ysize-diffy,diffx+1:xsize) = src(1:ysize-diffy,diffx+1:xsize) + tmp(diffy+1:ysize,1:xsize-diffx);
end
bayer = src;