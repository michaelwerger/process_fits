%% 
% *PATHS*

addpath('/Users/Micha/Workspaces/matlab/processfits/src')
addpath('/Users/Micha/data/20180605/src');

fitspath = '/Users/Micha/data/20180605/data';
homepath = '/Users/Micha/data/20180605';
matpath = '/Users/Micha/data/20180605/mat';


cd(homepath);

%%
object = 'IC5070'
%% 
%% bias, dark & flat
%%
a = [ 90:94];
dark = dodark(fitspath,'Dark_30,000secs_00',a);

a = [ 20:29];
bias = dobias(fitspath,'Bias_0,001secs_00',a);

a = [ 30:41];
flat = doflat(fitspath,'FlatField_1,000secs_00',a,bias,dark);

normflat(:,:,1) = flat(:,:,1) ./ max(max(flat(:,:,1)));
normflat(:,:,2) = flat(:,:,2) ./ max(max(flat(:,:,2)));
normflat(:,:,3) = flat(:,:,3) ./ max(max(flat(:,:,3)));

%%
figure()
imagesc(normflat(:,:,2),[0.997,1.000]);
colorbar()
%% 
% *image*
%%

a = [ 69:89];
% M57_Light_30,000secs_00000058
rgb = dofiles(fitspath,'IC5070_Light_30,000secs_00',a,bias,dark,normflat);

%%

column = 1542;
maxintensity = 6000;
minintensity = 4500; % 40000;
factor_r = 1.03;
factor_g = 1.00;
factor_b = 2.20;

figure();
subplot(1,3,1);
plot(rgb(column,:,1)*factor_r);
axis([0 5000 minintensity maxintensity]);

subplot(1,3,2);
plot(rgb(column,:,2)*factor_g);
axis([0 5000 minintensity maxintensity]);

subplot(1,3,3);
plot(rgb(column,:,3)*factor_b);
axis([0 5000 minintensity maxintensity]);




%%

figure()
subplot(1,3,1);
imagesc(rgb(:,:,1)*factor_r,[minintensity maxintensity]);

subplot(1,3,2);
imagesc(rgb(:,:,2)*factor_g,[minintensity maxintensity]);

subplot(1,3,3);
imagesc(rgb(:,:,3)*factor_b,[minintensity maxintensity]);

%%
figure()

hr = histogram(rgb(:,:,1)*factor_r);
hr.FaceColor = 'r';
hr.EdgeAlpha = 0.6000;
hr.EdgeColor = 'r';
hr.FaceAlpha = 0.6000;
hr.BinEdges = [minintensity*0.8:maxintensity*1.2];
hold on
hg = histogram(rgb(:,:,2)*factor_g);
hg.FaceColor = 'g';
hg.EdgeAlpha = 0.6000;
hg.EdgeColor = 'g';
hg.FaceAlpha = 0.6000;
hg.BinEdges = [minintensity*0.8:maxintensity*1.2];

hb = histogram(rgb(:,:,3)*factor_b);
hb.FaceColor = 'b';
hb.EdgeAlpha = 0.6000;
hb.EdgeColor = 'b';
hb.FaceAlpha = 0.6000;
hb.BinEdges = [minintensity*0.8:maxintensity*1.2];
hold off
%%
result = rgb;
result(:,:,1) = result(:,:,1) * factor_r;
result(:,:,2) = result(:,:,2) * factor_g;
result(:,:,3) = result(:,:,3) * factor_b;
% indices = result > maxintensity;
% result(indices) = maxintensity;
% indices = result < minintensity;
% result(indices) = minintensity;
% result = result - minintensity;
save(strcat(homepath,'/','mat/',object,'_rgb.mat'),'result');


%% 
% Write final image (linear)
%%
rgb_scaled = uint16((result - minintensity)/(maxintensity - minintensity)*65535);
rgb_scaled(rgb_scaled > 65535) = 0;
rgb_scaled(rgb_scaled < 1) = 0;
%%
nbins = 5;
xmin = 100;
xmax = 65536-100;

figure()
hold on
hr = histogram(rgb_scaled(:,:,1));
hr.NumBins = nbins;
hr.BinEdges = [xmin:xmax];
hr.FaceColor = 'r';
hr.EdgeAlpha = 0.6000;
hr.EdgeColor = 'r';
hr.FaceAlpha = 0.6000;
hg = histogram(rgb_scaled(:,:,2));
hg.NumBins = nbins;
hg.BinEdges = [xmin:xmax];
hg.FaceColor = 'g';
hg.EdgeAlpha = 0.6000;
hg.EdgeColor = 'g';
hg.FaceAlpha = 0.6000;
hb = histogram(rgb_scaled(:,:,3));
hb.NumBins = nbins;
hb.BinEdges = [xmin:xmax];
hb.FaceColor = 'b';
hb.EdgeAlpha = 0.6000;
hb.EdgeColor = 'b';
hb.FaceAlpha = 0.6000;
hold off


%%
writeRGBTIFF(rgb_scaled,strcat(homepath,'/products/',object,'_prelim.tif'));
%% 
% Write final image (log)
%%
%column = 1542;
%maxintensity = 15000;
%minintensity = 100;

figure();
logresult = log10(result);

subplot(1,3,1);
plot(logresult(column,:,1));
axis([0 5000 log10(minintensity) log10(maxintensity)]);

subplot(1,3,2);
plot(logresult(column,:,2));
axis([0 5000 log10(minintensity) log10(maxintensity)]);

subplot(1,3,3);
plot(logresult(column,:,3));
axis([0 5000 log10(minintensity) log10(maxintensity)]);
%axis([0 5000 minintensity maxintensity]);

%%

figure()
minintensity = 3.68;
maxintensity = 3.75;
indices = logresult > maxintensity;
logresult(indices) = maxintensity;
indices = logresult < minintensity;
logresult(indices) = minintensity;
logresult = logresult - minintensity;

figure();

subplot(1,3,1);
plot(logresult(1542,:,1));
%axis([0 5000 0 100]);

subplot(1,3,2);
plot(logresult(1542,:,2));
%axis([0 5000 0 100]);

subplot(1,3,3);
plot(logresult(1542,:,3));
%axis([0 5000 0 100]);

%%

%writeRGBTIFF(uint16(40000*logresult),strcat(homepath,'/products/',object,'_log_prelim.tif'));