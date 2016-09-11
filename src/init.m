xsize = 5568
ysize = 3708

dark_ISO200_30 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2706.dng'));
dark_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2712.dng'));
dark_ISO800_30 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2703.dng'));
dark_ISO800_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2710.dng'));
flat_ISO200_1 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2692.dng')) - dark_ISO200_60;
flat_ISO800_1 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2696.dng')) - dark_ISO800_60;



