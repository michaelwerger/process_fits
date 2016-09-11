fixed_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2564.jpg');
moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2566.jpg');
fixed = fixed_lin_rgb(:,:,1);
moving = moving_lin_rgb(:,:,1);
transformType = 'Translation';
[optimizer, metric] = imregconfig ('monomodal')
moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
result = fixed + moving_reg;
moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2568.jpg');
moving = moving_lin_rgb(:,:,1);
moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
result = result + moving_reg;

moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2570.jpg');
moving = moving_lin_rgb(:,:,1);
moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;

% moving_lin_rgb = imread('/Users/Micha/data/20160719/jpg/IMG_2572.jpg');
% moving = moving_lin_rgb(:,:,1);
% moving_reg = imregister(moving, fixed, transformType, optimizer, metric) ;
% result = result + moving_reg;
