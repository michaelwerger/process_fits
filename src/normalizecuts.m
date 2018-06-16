function [ result_array ] = normalizecuts( input_array, lower, upper )

    % stretch array into bounds lower ...upper and normalize to 0 ... 1
    
    if size(size(input_array)) == [1 2]
        disp([1 2])
    %CUTS clip array inbetween lower and upper value
        result_array = input_array;
        result_array(result_array >= upper) = upper;
        result_array(result_array <= lower) = lower;
        result_array = (result_array - lower)/(upper - lower);
        
    elseif size(size(input_array)) == [1 3]
    %CUTS clip array inbetween lower and upper valuefi
        disp([1 3])
        result_array = input_array;
        for i = [1:3]
            layer = input_array(:,:,i);
            layer(layer >= upper) = upper;
            layer(layer <= lower) = lower;
            result_array(:,:,i) = (layer - lower)/(upper - lower);
        end
    else
        disp(0)
        result_array = input_array;
    end
    
end

