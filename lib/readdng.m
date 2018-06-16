function [ lin_rgb ] = readdng( filename )
%READDNG Summary of this function goes here
%   Detailed explanation goes here
% AdobeRGB
srgb2xyz = [0.4124564 0.3575761 0.1804375;
    0.2126729 0.7151522 0.0721750;
    0.0193339 0.1191920 0.9503041];

% AppleRGB
srgb2xyz = [0.4497288  0.3162486  0.1844926;
 0.2446525  0.6720283  0.0833192;
 0.0251848  0.1411824  0.9224628];

%filename = '/Users/Micha/data/20160719_pacman/dng/IMG_2614.dng'; % Put file name here 
%filename = 'banana_slug.dng'
%warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
warning off MATLAB:tifflib:TIFFReadDirectory
t = Tiff(filename,'r');

%Tiff.getTagNames
offsets = getTag(t,'SubIFD');
%offsets(1)

setSubDirectory(t,offsets(1));
raw = read(t);
close(t);
meta_info = imfinfo(filename);
%meta_info.SubIFDs{1}
%meta_info.SubIFDs{2}

% Crop to only valid pixels
x_origin = meta_info.SubIFDs{1}.DefaultCropOrigin(2)+1;
width = meta_info.SubIFDs{1}.DefaultCropSize(1);
y_origin = meta_info.SubIFDs{1}.DefaultCropOrigin(1)+1;
height = meta_info.SubIFDs{1}.DefaultCropSize(2);
    
raw = double(raw(y_origin:height-1,x_origin:width-1));

% LinearizationTable does not exist here
%if isfield(meta_info.SubIFDs{1},'LinearizationTable'™)
%ltab=meta_info.SubIFDs{1}.LinearizationTable;
%raw = ltab(raw+1);

%Blacklevel does not exist, using MinSampleValue instead
black = meta_info.SubIFDs{1}.MinSampleValue(1);

saturation = meta_info.SubIFDs{1}.WhiteLevel;
lin_bayer = raw; % (raw-black)/(saturation-black);
%lin_bayer = max(0,min(lin_bayer,1));
%clear raw

wb_multipliers = (meta_info.AsShotNeutral).^ -1;
wb_multipliers = wb_multipliers/wb_multipliers(2);
mask = wbmask(size(lin_bayer,1),size(lin_bayer,2),wb_multipliers,'rggb');
balanced_bayer = lin_bayer .* mask;
temp = uint16(balanced_bayer/max(balanced_bayer(:))*pow2(16));
lin_rgb = uint16(demosaic(temp,'rggb'));


end

