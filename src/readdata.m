% # ISO t
 
warning('off','all');

clear raw
filenumbers = getfilenumbers(dngpath);
sz = size(filenumbers);
 
for i = [1:sz(1)]
    raw(i).object = object;
    raw(i).nnnn = filenumbers(i);
    ifile = char(strcat(dngpath, 'IMG_',filenumbers(i), '.dng')) ;
    raw(i).bayer = single(readrawfromdng(ifile));
    raw(i).rgb = single(demosaic(uint16(raw(i).bayer),'rggb'));
    raw(i).bayer = 0;
end