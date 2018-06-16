

xsize = 5568;
ysize = 3708;

faktor = 200000;

%vom 1.8.2016
% result01rgb = demosaic(uint16(m13_2646corr * faktor),'rggb');
% result01rgb = result01rgb + bayershiftdxdy( m13_2646corr, m13_2647corr, 'faktor', faktor);
% result01rgb = result01rgb + bayershiftdxdy( m13_2646corr, m13_2647corr, 'faktor', faktor);
% result01rgb = result01rgb + bayershiftdxdy( m13_2646corr, m13_2651corr, 'faktor', faktor);
% result01rgb = result01rgb + bayershiftdxdy( m13_2646corr, m13_2652corr, 'faktor', faktor);

% vom 12.8.2016

result2837rgb = demosaic(uint16(m13_2837corr * faktor),'rggb');
result2838rgb = bayershiftdxdy( m13_2837corr, m13_2838corr, 'faktor', faktor);
result2842rgb = bayershiftdxdy( m13_2837corr, m13_2842corr, 'faktor', faktor);
result2843rgb = bayershiftdxdy( m13_2837corr, m13_2843corr, 'faktor', faktor);
result2844rgb = bayershiftdxdy( m13_2837corr, m13_2844corr, 'faktor', faktor);

% combined

% xstart  = 2000
% xend    = 4000
% ystart  = 1000
% yend   = 3000
% 
% movg   = result02rgb(ystart:yend,xstart:xend,2);
% refg   = result01rgb(ystart:yend,xstart:xend,2);
% 
% [dx, dy] = getOffset(movg,refg);
% 
% resultrgb(:,:,1) = layershiftdxdy(result02rgb(:,:,1), dx, dy);
% resultrgb(:,:,2) = layershiftdxdy(result02rgb(:,:,2), dx, dy);
% resultrgb(:,:,3) = layershiftdxdy(result02rgb(:,:,3), dx, dy);
% 
% figure
% imagesc(result01rgb)
% figure
% imagesc(result02rgb)
% figure
% imagesc(resultrgb)


% imagesc(resultrgb)

%writeRGBTIFF(result02rgb,'/Users/Micha/data/20160812/m13.tif');