filename = '/Users/Micha/data/20160719_pacman/dng/IMG_2609.dng';
img_2609_lin_rgb = readdng(filename);
background = img_2609_lin_rgb;
size(background)
filename = '/Users/Micha/data/20160719_pacman/dng/IMG_2619.dng';
img_2619_lin_rgb = readdng(filename);
x0 = 2731;
x1 = 2686;
xd = (x0 - x1);
[xmax, ymax, channels] = size(background);
[3,x0,x1,xd,abs(xd),xmax-1,(xmax-1)-abs(xd),1, xmax-abs(xd),xmax-abs(xd)-1]

background(: ,abs(xd)+1:end, :) = background(:, abs(xd)+1:end, :) + img_lin_rgb(:, 1:end-abs(xd), :);
image(background)