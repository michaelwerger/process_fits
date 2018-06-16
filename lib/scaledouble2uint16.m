function rgb_uint16 = scaledouble2uint16(rgb_double)


    sz = size(rgb_double);
    szsz = size(sz)
    rgb_unit16 =  zeros(sz);
    if szsz(2) = 3
        for channel = 1:3
            mini = 0; % min(min(rgb_double(:,:,channel)));
            maxi = max(max(rgb_double(:,:,channel)));
            rgb_uint16(:,:,channel) = uint16 (   (rgb_double(:,:,channel) - mini)/maxi * 65536 );
        end
    elseif szsz(2) = 2
        mini = 0; % min(min(rgb_double(:,:,channel)));
        maxi = max(max(rgb_double));
        rgb_uint16 = uint16 (   (rgb_double - mini)/maxi * 65536 );
    else
        rgb_uint16 = uint16 ( rgb_double )
    end
    
end
