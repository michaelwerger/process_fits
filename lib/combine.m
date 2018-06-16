



clear result

result(1).object = object;
result(1).rgb = corr(1).rgb;

for i = [2:sz(1)]
    
    result(1).rgb = result(1).rgb + rgbshiftdxdy( corr(1).rgb, corr(i).rgb);
end

clear corr
