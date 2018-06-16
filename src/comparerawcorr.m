
colors = ['red','green','blue']
i = 1

rawrgb = demosaic(uint16(raw(i).bayer),'rggb');

for channel = [1,2,3]
for y0 = [1000,2000,3000]
figure
plot(rawrgb(:,y0,channel),'Color','black')
hold on
text(100,100,strcat('channel ',sprintf('%d',channel)))
text(1000,100,strcat('yaxis ',sprintf('%d',y0)))

axis([0,4000,-1000,2500])
plot(corr(i).rgb(:,y0,channel),'Color',colors(channel))
hold off
end
end