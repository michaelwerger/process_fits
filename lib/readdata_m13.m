% # ISO t
 
 
% vom 1.8.2016

m13_2646 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2646.dng')) - dark_ISO800_30 ;
m13_2646corr = m13_2646 ./ flat_ISO800_1 ;

m13_2647 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2647.dng')) - dark_ISO800_60 ;
m13_2647corr = m13_2647 ./ flat_ISO800_1 ;

m13_2648 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2648.dng')) - dark_ISO200_60 ;
m13_2648corr = m13_2648 ./ flat_ISO200_1 ;

m13_2651 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2651.dng')) - dark_ISO200_60 ;
m13_2651corr = m13_2651 ./ flat_ISO800_1 ;

m13_2652 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2652.dng')) - dark_ISO200_60 ;
m13_2652corr = m13_2652 ./ flat_ISO800_1 ;

% vom 12.8.2016

m13_2837 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2837.dng')) - dark_ISO800_30 ;
m13_2837corr = m13_2837 ./ flat_ISO800_1 ;

m13_2838 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2838.dng')) - dark_ISO800_30 ;
m13_2838corr = m13_2838 ./ flat_ISO800_1 ;

m13_2842 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2842.dng')) - dark_ISO800_30 ;
m13_2842corr = m13_2842 ./ flat_ISO800_1 ;

m13_2843 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2843.dng')) - dark_ISO800_30 ;
m13_2843corr = m13_2843 ./ flat_ISO800_1 ;

m13_2844 = double(readrawfromdng('/Users/Micha/data/20160812/dng/img_2844.dng')) - dark_ISO800_30 ;
m13_2844corr = m13_2844 ./ flat_ISO800_1 ;
