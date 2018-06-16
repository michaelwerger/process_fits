% # ISO t
 
 
% vom 12.8.2016

m92_2845 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2845.dng')) - dark_ISO800_30 ;
m92_2837corr = m92_2845 ./ flat_ISO800_1 ;

m92_2846 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2846.dng')) - dark_ISO800_60 ;
m92_2837corr = m92_2846 ./ flat_ISO800_1 ;

m92_2847 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2847.dng')) - dark_ISO800_30 ;
m92_2843corr = m92_2847 ./ flat_ISO800_1 ;

m92_2848 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2848.dng')) - dark_ISO800_60 ;
m92_2843corr = m92_2848 ./ flat_ISO800_1 ;
