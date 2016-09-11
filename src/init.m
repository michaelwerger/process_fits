% naming: type_ISOiiiii_s_n
% iiii ISO 200, 800, 6400, ...
% s exposure time in seconds (rounded)
% n consecutive number of this type
%flat_ISO200_1_1 = imread('/Users/Micha/data/20160806/dng/img_2691.dng');
%flat_ISO200_1_2 = imread('/Users/Micha/data/20160806/dng/img_2692.dng');
%moon = imread('/Users/Micha/data/20160806/dng/img_2687.dng');
%image(moon)ima
%warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
%filename = '/Users/Micha/data/20160806/dng/img_2687.dng'
%info = imfinfo(filename)
%info.SubIFDs{1}
%t = Tiff(filename,'r');,
%%%
%offsets = getTag(t,'SubIFD');
%setSubDirectory(t,offsets);
%moon = read(t);
%close(t);
%imagesc(moon)
%moonraw = readrawfromdng(filename);
%moon = readrgbfromdng(filename);
% from here raw only ( i.e. bayes mosaic )

xsize = 5568
ysize = 3708

dark_ISO800_30 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2703.dng'));
flat_ISO800_1 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2695.dng')) - dark_ISO800_30;

dark_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2712.dng'));
flat_ISO200_1 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2692.dng')) - dark_ISO200_60;



