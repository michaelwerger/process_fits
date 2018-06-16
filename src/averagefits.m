function [ raw ] = averagefits( fitspath, filenames )
%AVERAGEFILES Average list of fits files
sz = size(filenames)

filename = char(strcat(fitspath,'/',string(filenames(1))))
raw = fitsread(filename);
for i = 2:sz(1)
    filename = char(strcat(fitspath,'/',string(filenames(i))))
    raw = raw + fitsread(filename);
end
raw = raw/sz(1);

end

