data = raw(1).bayer;
rgb = demosaic(uint16(data*1.0),'rggb');

meanr = mean(mean(rgb(1000:3000,1000:3000,1)))
meang = mean(mean(rgb(1000:3000,1000:3000,2)))
meanb = mean(mean(rgb(1000:3000,1000:3000,3)))

figure

y0 = 1900

plot(rgb(:,y0,1),'Color','red')
hold on
axis([0,4000,0,meanr*2])
plot(rgb(:,y0,2),'Color','green')
plot(rgb(:,y0,3),'Color','blue')
hold off
