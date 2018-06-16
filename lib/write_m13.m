% 
% finalrgb = result(1).rgb;
% lo = 2000
% hi = 3000
% finalrgb(:,:,1) = (log10(cuts(result(1).rgb(:,:,1),lo,hi)) - log10(lo)) * 100.0 / (log10(hi)-log10(lo));
% lo = 3000
% hi = 10000
% finalrgb(:,:,2) = (log10(cuts(result(1).rgb(:,:,2),lo,hi)) - log10(lo)) * 100.0 / (log10(hi)-log10(lo));
% lo = 1500
% hi = 6000
% finalrgb(:,:,3) = (log10(cuts(result(1).rgb(:,:,3),lo,hi)) - log10(lo)) * 100.0 / (log10(hi)-log10(lo));
% 
% im1 = figure()
% figure(im1)
% imagesc(finalrgb(:,:,1))
% im2 = figure()
% figure(im2)
% imagesc(finalrgb(:,:,2))
% im3 = figure()
% figure(im3)
% imagesc(finalrgb(:,:,3))
% 
% writeRGBTIFF(uint16(finalrgb*1023),strcat(path,'/',object,'.tif'));

% scrsz = get(groot,'ScreenSize');
% f1 = figure('Position',[scrsz(4) scrsz(4)/2 scrsz(3)/3 scrsz(4)/3])
% histogram(result(1).rgb)
% axis([-2000 8000 0 10^6])
% f2 = figure('Position',[scrsz(4) 1 scrsz(3)/3 scrsz(4)/3])
% histogram(finalrgb(:,:,1))

scrsz = get(groot,'ScreenSize');
%figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])

figh1 = figure('Position',[1 200 400 400])
hold on
r = result(1).rgb(:,:,1);
hr = histogram(r)
hr.FaceColor = 'red'
axis([-2000 10000 0 3000000])

g = result(1).rgb(:,:,2);
hg = histogram(g)
hg.FaceColor = 'green'
 
b = result(1).rgb(:,:,3);
hb = histogram(b)
hb.FaceColor = 'blue'
hold off


figh2 = figure('Position',[400 200 400 400])
hold on
r = result(1).rgb(:,:,1);
hr = histogram(r)
hr.FaceColor = 'red'
axis([-2000 4000 0 3000000])

g = result(1).rgb(:,:,2)*0.66;
hg = histogram(g)
hg.FaceColor = 'green'
 
b = result(1).rgb(:,:,3)*1.25;
hb = histogram(b)
hb.FaceColor = 'blue'
hold off

 
finalrgb = result(1).rgb;
finalrgb(:,:,1) = result(1).rgb(:,:,1);
finalrgb(:,:,2) = result(1).rgb(:,:,2) * 0.66;
finalrgb(:,:,3) = result(1).rgb(:,:,3) * 1.25;

object = 'test'
path = '/Users/Micha/data/20160924';
writeRGBTIFF(uint16(finalrgb*10),strcat(path,'/',object,'.tif'));