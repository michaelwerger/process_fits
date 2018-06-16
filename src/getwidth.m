function [ix] = getwidth(varargin)

    % determine width of normalized peak with respect to continuum  (:= 0) 

    curve = varargin{1};

    % default:
    
    wx = 10;
    limit = 0.02;
    if length(varargin) == 3
        if varargin{2} == "window"
            wx = varargin{3}
        end
        if varargin{2} == "limit"
            limit = varargin{3}
        end
    end
    if length(varargin) == 5
        if varargin{2} == "window"
            wx = varargin{3}
        end
        if varargin{4} == "window"
            wx = varargin{5}
        end
        if varargin{2} == "limit"
            limit = varargin{3}
        end
        if varargin{4} == "limit"
            limit = varargin{5}
        end
    end       
            
    
    [mx,im] = max(curve);
    szx = numel(curve);
                
    if im >  szx / 2
        xc = int16(szx / 4);
    else
        xc = int16(szx - szy / 4);
    end

    
    dark = mean(curve(xc-wx:xc+wx));

    normalized = curve - dark;
    normalized = normalized / max(normalized);

    x=1:1:szx;
    ix = x(normalized > limit);
    disp([im,mx])
                
end

