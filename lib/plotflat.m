im = figure()
figure(im)
imagesc(cuts(flatrgb(:,:,2),12000,14000))

plx = figure()
figure(plx)
plot(cuts(flatrgb(1900,:,2),12000,14000))

ply = figure()
figure(ply)
plot(cuts(flatrgb(:,3580,2),12000,14000))

immed = figure()
figure(immed)
md = medfilt2(flatrgb(:,:,2), [10 10]);
mx = max(max(md));
md = md / mx;

imagesc(cuts(md,0.9,1.0))

plxmed = figure()
figure(plxmed)
plot(cuts(md(1900,:),0.9,1.0))

plymed = figure()
figure(plymed)
plot(cuts(md(:,3580),0.9,1.0))