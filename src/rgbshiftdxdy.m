function [ outrgb ] = rgbshiftdxdy( refrgb, movrgb, varargin )

    % correct shift of a bayer-mask based input image movBayer against
    % reference bayer refBayer
    
    % return a rgb image
    
    % optionally arguments:
    % faktor: scaling of intensity to apply
    % xstart, ystart: corner of image used in cross-correlation
    % xend, yend: corner of image used in cross-correlation
    % note: both corners must fully lay inside both images
    
    faktor = 0;
    xstart = 0;
    xend   = 0;
    ystart = 0;
    yend   = 0;
    
    if nargin >2
        for ix = 1:2:nargin-3
            
            %disp([nargin ix varargin])
            if strcmp(varargin{ix},'faktor')
                faktor = varargin{ix+1};
            elseif strcmp(varargin{ix},'xstart')
                xstart = varargin{ix+1};
            elseif strcmp(varargin{ix},'xend')
                xend = varargin{ix+1};
            elseif strcmp(varargin{ix},'ystart')
                ystart = varargin{ix+1};
            elseif strcmp(varargin{ix},'yend')
                yend = varargin{ix+1};
            else
                % nothing matches
            end
        end
    
    end

    
    %refrgb = demosaic(uint16(refBayer*faktor),'rggb');
    %movrgb = demosaic(uint16(movBayer*faktor),'rggb');
    
    [ysize, xsize] = size(movrgb(:,:,2));
    if xstart == 0
        xstart = int16(xsize/8);
    end
    if xend == 0
        xend   = int16(xsize/8*7);
    end
    if ystart == 0
        ystart = int16(ysize/8);
    end
    if yend == 0
        yend   = int16(ysize/8*7);
    end
    %disp([xstart xend xsize ystart yend ysize])
    movg   = movrgb(ystart:yend,xstart:xend,2);
    refg   = refrgb(ystart:yend,xstart:xend,2);
    
    [dx, dy] = getOffset(movg,refg);

    outrgb(:,:,1) = layershiftdxdy(movrgb(:,:,1), dx, dy);
    outrgb(:,:,2) = layershiftdxdy(movrgb(:,:,2), dx, dy);
    outrgb(:,:,3) = layershiftdxdy(movrgb(:,:,3), dx, dy);
end

