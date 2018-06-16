function [ result_array ] = cuts( input_array, lower, upper )
    if size(size(input_array)) == [1 2]
        disp([1 2])
    %CUTS clip array inbetween lower and upper value
        result_array = input_array;
        result_array(result_array >= upper) = upper;
        result_array(result_array <= lower) = lower;
        %result_array = (result_array - lower)/(upper - lower)*100;
        
    elseif size(size(input_array)) == [1 3]
    %CUTS clip array inbetween lower and upper valuefi
        disp([1 3])
        result_array = input_array;
        for i = [1:3]
            layer = input_array(:,:,i);
            layer(layer >= upper) = upper;
            layer(layer <= lower) = lower;
            result_array(:,:,i) = layer; %(layer - lower)/(upper - lower)*100;
        end
    else
        disp(0)
        result_array = input_array;
    end
    
end

