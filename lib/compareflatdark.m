
% for channel = [1,2,3]
% for y0 = [1000,2000,3000]
% figure
% plot(darkrgb(:,y0,channel),'Color','black')
% hold on
% text(100,100,strcat('channel ',sprintf('%d',channel)))
% text(1000,100,strcat('yaxis ',sprintf('%d',y0)))
% 
% axis([0,4000,-1000,20000])
% plot(flatrgb(:,y0,channel),'Color','cyan')
% hold off
% end
% end

y0 = 50
y1 = ysize - y0
x0 = 50
x1 = xsize - x0
[x0 x1 y0 y1]
figure
imagesc(cuts(flatrgb(:,:,1),4000,6000))
figure
imagesc(cuts(flatrgb(:,:,2),10000,14000))
figure
imagesc(cuts(flatrgb(:,:,3),10000,14000))
for ch = [1 2 3]
    figure
    flat_layer = single(flatrgb(y0:y1,x0:x1,1));
    vmin = min(min(flat_layer))
    vmax = max(max(flat_layer))
    imagesc(cuts(((flat_layer - vmin) / ( vmax - vmin)),0.4,0.7))
end