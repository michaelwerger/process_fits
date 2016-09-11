img_2614_lin_rgb = readdng('/Users/Micha/data/20160719_pacman/dng/IMG_2614.dng');
colormap 'Pink'
% image(log10(double(cuts(img_2614_lin_rgb(:,:,1),100,250))),'CDataMapping','scaled')
%colorbar
channel = 2
ypos = 2000
y = img_2614_lin_rgb(:,ypos,channel)
ysum = y
plot(y)
hold on
img_2615_lin_rgb = readdng('/Users/Micha/data/20160719_pacman/dng/IMG_2615.dng');
y = img_2615_lin_rgb(:,ypos,channel)
ysum = ysum + y;
plot(y)
img_2616_lin_rgb = readdng('/Users/Micha/data/20160719_pacman/dng/IMG_2616.dng');
y = img_2616_lin_rgb(:,ypos,channel)
ysum = ysum + y;
plot(y)
img_2617_lin_rgb = readdng('/Users/Micha/data/20160719_pacman/dng/IMG_2617.dng');
y = img_2617_lin_rgb(:,ypos,channel)
ysum = ysum + y;
plot(y)
img_2618_lin_rgb = readdng('/Users/Micha/data/20160719_pacman/dng/IMG_2618.dng');
y = img_2618_lin_rgb(:,ypos,channel)
ysum = ysum + y;
plot(y)
img_2619_lin_rgb = readdng('/Users/Micha/data/20160719_pacman/dng/IMG_2619.dng');
y = img_2619_lin_rgb(:,ypos,channel)
ysum = ysum + y;
ysum = ysum/6.0;
plot(y)
hold off
