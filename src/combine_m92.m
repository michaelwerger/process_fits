

xsize = 5568;
ysize = 3708;

faktor = 1000000;
resultrgb = demosaic(uint16(m92_2845corr * faktor),'rggb');

resultrgb = resultrgb + bayershiftdxdy( m92_2845corr, m92_2846corr, faktor);
figure
imagesc(resultrgb)

resultrgb = resultrgb + bayershiftdxdy( m92_2845corr, m92_2847corr, faktor);
figure
imagesc(resultrgb)
  
resultrgb = resultrgb + bayershiftdxdy( m92_2845corr, m92_2848corr, faktor);
figure
imagesc(resultrgb)


%writeRGBTIFF(resultrgb,'/Users/Micha/data/20160812/m92.tif');