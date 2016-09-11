clear corr
for i = [1:sz(1)]
    
    
    
    rawrgb = single(demosaic(uint16(raw(i).bayer),'rggb'));
    corr(i).object = object;
    corr(i).nnnn = cnnnn{i};
    corr(i).rgb =  reducergb(rawrgb,darkrgb,normflatrgb);
    
end