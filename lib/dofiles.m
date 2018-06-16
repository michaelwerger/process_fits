function rgb = dofiles(fitspath,filenamesuffix,numbers,bias,dark,normflat)
    first = 1;
    bayes = 'rggb';
    %load(strcat(fitspath,'/','mat/bias.mat'));
    %load(strcat(fitspath,'/','mat/dark.mat'));
    %load(strcat(fitspath,'/','mat/normflat.mat'));
    numbers
    for nr = numbers
        currentNumber = sprintf('%06d',nr)
        f = strcat(fitspath,'/',filenamesuffix,currentNumber,'.fit')
        if exist(f) == 2
            f
            if first == 1
                'initial'
                first = 0;
                raw = fitsread(f);
                data_initial = (demosaic(uint16(raw),bayes));
                
                r_initial_corr = (double(data_initial(:,:,1)) - dark(:,:,1) - bias(:,:,1))./normflat(:,:,1) ;
                g_initial_corr = (double(data_initial(:,:,2)) - dark(:,:,2) - bias(:,:,2))./normflat(:,:,2) ;
                b_initial_corr = (double(data_initial(:,:,3)) - dark(:,:,3) - bias(:,:,3))./normflat(:,:,3) ;
                r = r_initial_corr;
                g = g_initial_corr;
                b = b_initial_corr;
                
            else
                'following'
                raw = fitsread(f);
                data_following = (demosaic(uint16(raw),bayes));
                
                r_following_corr = (double(data_following(:,:,1)) - dark(:,:,1) - bias(:,:,1))./normflat(:,:,1) ;
                g_following_corr = (double(data_following(:,:,2)) - dark(:,:,2) - bias(:,:,2))./normflat(:,:,2) ;
                b_following_corr = (double(data_following(:,:,3)) - dark(:,:,3) - bias(:,:,3))./normflat(:,:,3) ;
                
                [dx, dy] = getOffset(g_following_corr,g_initial_corr)
                
                r = r + layershiftdxdy(r_following_corr, dx, dy);
                g = g + layershiftdxdy(g_following_corr, dx, dy);
                b = b + layershiftdxdy(b_following_corr, dx, dy);
            end
        end
    end
    rgb(:,:,1) = r;
    rgb(:,:,2) = g;
    rgb(:,:,3) = b;
end
