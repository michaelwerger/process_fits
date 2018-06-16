function [ filenumbers ] = getfilenumbers( dngpath )
%GETFILENUMBERS Summary of this function goes here
%   Detailed explanation goes here
    oldFolder = cd(dngpath);
    listing = dir('.');
    szls = size(listing);
    filenumbers = [];
    for i = [1:szls(1)]

        %disp([i,listing(i).name])
        if strcmp(listing(i).name, '.' ) || (strcmp(listing(i).name,'..' )) || (strcmp(listing(i).name,'.DS_Store' ))
            % pass
        else
            [token, matches] = strsplit(listing(i).name, '(IMG_|.dng)', ...
                'DelimiterType', 'RegularExpression');
            filenumbers = [filenumbers; token(2)];
        end
    end
    cd(oldFolder);

end

