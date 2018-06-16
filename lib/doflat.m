function flat = doflat(fitspath,filenamesuffix,numbers,bias,dark)
    first = 1;
    bayes = 'rggb';
    count = 0
    for nr = numbers
        currentNumber = sprintf('%06d',nr)
        f = strcat(fitspath,'/',filenamesuffix,currentNumber,'.fit')
        if exist(f) == 2
            f
            if first == 1
                'initial'
                first = 0;
                raw = fitsread(f);
                data = (demosaic(uint16(raw),bayes));
                
                r = double(data(:,:,1)) - dark(:,:,1) - bias(:,:,1);
                g = double(data(:,:,2)) - dark(:,:,2) - bias(:,:,2);
                b = double(data(:,:,3)) - dark(:,:,3) - bias(:,:,3);
                
                count = 1;
                
            else
                'following'
                raw = fitsread(f);
                data = (demosaic(uint16(raw),bayes));
                
                r = r + double(data(:,:,1)) - dark(:,:,1) - bias(:,:,1);
                g = g + double(data(:,:,2)) - dark(:,:,2) - bias(:,:,2);
                b = b + double(data(:,:,3)) - dark(:,:,3) - bias(:,:,3);
                
                count = count + 1 ;
            end
        end
    end
    flat(:,:,1) = r / count;
    flat(:,:,2) = g / count;
    flat(:,:,3) = b / count;
end
