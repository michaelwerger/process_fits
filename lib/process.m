% # ISO t
 
warning('off','all');

clear raw
filenumbers = getfilenumbers(dngpath);
sz = size(filenumbers);
 
for i = [1:sz(1)]
    ifile = char(strcat(dngpath, 'IMG_',filenumbers(i), '.dng')) ;
    if i < 2
        result(1).bayer = single(readrawfromdng(ifile));
        result(1).rgb   = single(demosaic(uint16(result(1).bayer),'rggb'));
        result(1).rgb   = reducergb(result(1).rgb,darkrgb,normflatrgb);
        masterrgb       = result(1).rgb;
 
    else
        result(2).bayer = single(readrawfromdng(ifile));
        result(2).rgb   = single(demosaic(uint16(result(2).bayer),'rggb'));
        result(2).rgb   = reducergb(result(2).rgb,darkrgb,normflatrgb);
        result(1).rgb   = result(1).rgb + rgbshiftdxdy( masterrgb, result(2).rgb);
    end
end
