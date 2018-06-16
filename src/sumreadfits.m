function [ rgbsum ] = sumreadfits( filename, varargin )
    % read from FITS data file and combine
    
    % parameters
    % filename FITS data filename
    % varargin optional parameter to control selection of specific channels
    %          'r' select red channel 1
    %          'g' select green channel 2
    %          'b' select blue channel 3
    %          also allowed: "rgb"
    
    raw = fitsread(filename);
    rgb = demosaic(uint16(raw),'rggb');
    if nargin == 1
        
        %rgbsum = rgb(:,:,1);
        %rgbsum = rgbsum+rgb(:,:,2) ;
        rgbsum = rgb;
    elseif nargin == 2
        L = strlength(varargin{1});
        channels = replace(varargin{1},'r','1');
        channels = replace(channels,'g','2');
        channels = replace(channels,'b','3');
        if L == 1
            rgbsum = rgb(:,:,sscanf(channels,'%1d'));
        elseif L == 2
            rgbsum = rgb(:,:,sscanf(channels(1),'%1d'));
            rgbsum = rgbsum + rgb(:,:,sscanf(channels(2),'%1d'));
        else
            rgbsum = rgb(:,:,1);
            rgbsum = rgbsum+rgb(:,:,2) ;
            rgbsum = rgbsum+rgb(:,:,3);
        end
    else
        'Not supported'
    end
end