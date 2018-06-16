function [index] = isincellarray(varargin,pattern)
    %
    % try to be similar to python in - however, 'in' is alread misused 
    % return 0 if not found, otherwise index > 0

    % assuming varargin has 1-dim structure
    % finds the leftmost matching index

    index = 0;
    for i=length(varargin):-1:1
        %disp({i,varargin{i},pattern, strfind(varargin{i},pattern)})
        
        if strfind(varargin{i},pattern) ~= [i]
            index = i;
        end
    end

end

