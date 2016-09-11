function [ result_array ] = cutsRGB( input_array, lower, upper )
%CUTS clip array inbetween lower RGB and upper RGB
    result_array = input_array;
    for channel=1,3
        tmp = result_array(:,:,channel);
        
        tmp(tmp >= upper(channel)) = upper(channel);
        tmp(lower(channel) >= tmp) = lower(channel);
        result_array(:,:,channel) = tmp;
    end
end

