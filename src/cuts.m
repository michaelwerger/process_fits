function [ result_array ] = cuts( input_array, lower, upper )
%CUTS clip array inbetween lower and upper value
    result_array = input_array;
    result_array(result_array >= upper) = upper;
    result_array(lower >= result_array) = lower;
    result_array = (result_array - lower)/(upper - lower)*100;
end

