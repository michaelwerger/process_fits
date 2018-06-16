clear corr
for i = [1:sz(1)]
    
    
    
    %rawrgb = single(demosaic(uint16(raw(i).bayer),'rggb'));
    
    corr(i).object = object;
    corr(i).nnnn = filenumbers(i);
    corr(i).rgb =  reducergb(raw(i).rgb,darkrgb,normflatrgb);
    
end
clear raw