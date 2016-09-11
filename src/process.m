% fixed_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2564.jpg');
% moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2566.jpg');
% fixed = fixed_lin_rgb(:,:,1);
% moving = moving_lin_rgb(:,:,1);
% transformType = 'Translation';
% [optimizer, metric] = imregconfig ('monomodal')
% moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
% result = fixed + moving_reg;
% moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2568.jpg');
% moving = moving_lin_rgb(:,:,1);
% moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
% result = result + moving_reg;
% 
% moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2570.jpg');
% moving = moving_lin_rgb(:,:,1);
% moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
% 
% % moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2572.jpg');
% % moving = moving_lin_rgb(:,:,1);
% moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
% result = result + moving_reg;

m31_ISO800_30_2800 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2800.dng')) - dark_ISO800_30 ;
m31 = m31_ISO800_30_2800 ./ flat_ISO800_1 ;

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2805.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 3117, 2075, 3145, 2033 );

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2811.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 3075, 2109, 3145, 2033 );

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2818.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 3033, 2139, 3145, 2033 );

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2805.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 3177, 2077, 3145, 2033 );

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2823.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 3001, 2187, 3145, 2033 );

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2826.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 2979, 2201, 3145, 2033 );

m31_ISO200_60 = double(readrawfromdng('/Users/Micha/data/20160806/dng/img_2827.dng')) ;
m31 = reducebayer(m31, m31_ISO200_60, flat_ISO200_1, dark_ISO200_60, 2977, 2199, 3145, 2033 );

imagesc(log10(cuts(m31,0.16,5)));

m31_final = cuts(m31(55:3487,302:5447 ),0.16,2);


