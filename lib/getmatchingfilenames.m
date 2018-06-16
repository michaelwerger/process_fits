function [ filenames ] = getmatchingfilenames( filedir, prefix, range )
%GETFILES builds a list of filenames matching prefix and range in directory
%filedir
    
oldFolder = cd(filedir);
listing = dir('.');
szls = size(listing);
filenames = [];
for i = [1:szls(1)]
    if contains(listing(i).name, prefix)
        filenames = [filenames; cellstr(listing(i).name)];
    end
end


end

