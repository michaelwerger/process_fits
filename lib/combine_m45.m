

xsize = 5568;
ysize = 3708;

faktor = 1000;
resultrgb = demosaic(uint16(m45_ISO800_30_2879_corr * faktor),'rggb');

resultrgb = resultrgb + bayershiftdxdy( m45_ISO800_30_2879_corr, m45_ISO800_30_2876_corr, faktor);
figure
imagesc(resultrgb)

resultrgb = resultrgb + bayershiftdxdy( m45_ISO800_30_2879_corr, m45_ISO800_30_2876_corr, faktor);
figure
imagesc(resultrgb)
 
resultrgb = resultrgb + bayershiftdxdy( m45_ISO800_30_2879_corr, m45_ISO800_30_2874_corr, faktor);
figure
imagesc(resultrgb)

resultrgb = resultrgb + bayershiftdxdy( m45_ISO800_30_2879_corr, m45_ISO800_30_2873_corr, faktor);
figure
imagesc(resultrgb)

resultrgb = resultrgb + bayershiftdxdy( m45_ISO800_30_2879_corr, m45_ISO800_30_2872_corr, faktor);
figure
imagesc(resultrgb)

resultrgb = resultrgb + bayershiftdxdy( m45_ISO800_30_2879_corr, m45_ISO800_30_2871_corr, faktor);
figure
imagesc(resultrgb)


% figure
% imagesc(resultrgb)

writeRGBTIFF(resultrgb,'/Users/Micha/data/20160812/m45.tif');