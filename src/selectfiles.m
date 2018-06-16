function selection = selectfiles(varargin)
%SELECTFILES Summary of this function goes here
%   mandatory input arguments
%   path           path to search for files matching given prefix
%   prefix         string pattern (without wildcards) for filenames
%   optional input arguments
%   plot           plot matching files
%   max            select files by using relative difference to maximum value
%   maxvalue       value given as float
%   dark           use the following filename as dark file
%   darkfilename   filename for dark file
%   diff           select files by using rms difference to reference file
%   masterfilename reference file for rms
%   output
%   selection(i).name matching filenames
%   selection(i).trace 1-dim spectrum
%   selection(i).rms rms value
    
    path = varargin{1};
    prefix = varargin{2};
    
    oldpath = cd(path);
    
    pattern = char(strcat(prefix,'*.fit'));
    files = dir(pattern);
    
    max_i = 0;
    selection = struct([]);
    
    if length(varargin) > 2
        
        if isincellarray(varargin, 'dark') > 0
            index = isincellarray(varargin, 'dark');
            darkfilename = varargin{index+1};
            dark = fitsread(darkfilename);
        else
            dark = fitsread(files(1).name);
        end
        if isincellarray(varargin, 'max') > 0
            index = isincellarray(varargin, 'max');
            for i = [1:numel(files)]
                
                white = fitsread(files(i).name);
                
                trace = sum(white,2);
                [mx,im] = max(trace);
                max_i = max(max_i,mx);
                
            end
            if length(varargin) > index % assuming next arg contains value
                
                min_i = varargin{index+1} * max_i;
            else
                min_i = (0.9 * max_i);
            end
            j = 1;
            for i = [1:numel(files)]
                white = fitsread(files(i).name);
                trace = sum(white,2);
                [mx,im] = max(trace);
                if mx >= min_i
                    disp({int32(min_i),mx,max_i,files(i).name})
                    selection(j).name = files(i).name;
                    j = j+1;
                end
                
            end

        elseif isincellarray(varargin, 'plot') > 0
            for i = [1:numel(files)]
                filenames = [filenames; files(i).name ];
                white = fitsread(files(i).name);
                trace = sum(white,2);
                disp(files(i).name)
                figure()
                
                plot(trace)
                title(files(i).name)
            end
        elseif isin(varargin, 'diff') > 0
            j = 1;
            index = isincellarray(varargin, 'diff');
            masterfilename = varargin{index+1}
            index = isincellarray(varargin, 'rms');
            rmsvalue = double(varargin{index+1})
            white = fitsread(masterfilename) - dark;
            mastertrace = sum(white,1);
            nmastertrace = mastertrace / max(mastertrace);
            nummastertrace = numel(mastertrace);
            figure()
            hold on
            title(pattern,'Interpreter','none')
            plot(nmastertrace,'k-')
            ylim([0 1])
            selection(j).name = masterfilename;
            selection(j).rms = 0.0;
            selection(j).trace = mastertrace;
            j = j + 1;
            for i = [1:numel(files)]
                if not( strcmp(files(i).name,masterfilename))
                    white = fitsread(files(i).name) - dark;
                    trace = sum(white,1);
                    ntrace = trace/max(trace);
                    rms = sqrt(sum((trace - mastertrace).^2)/nummastertrace);
                    
                    if rms < rmsvalue
                        disp({files(i).name,rms,'accepted'})
                        plot(ntrace,'b-')
                        selection(j).name = files(i).name;
                        selection(j).rms = rms;
                        selection(j).trace = trace;
                        j = j+1;
                    else
                        disp({files(i).name,rms})
                    end
                end
            end
            hold off
        else
            for i = [1:numel(files)]
                selection(i).name = files(i).name;
            end
        end
            
    else
        for i = [1:numel(files)]
                selection(i).name = files(i).name;
        end
    end
    
    
    cd(oldpath);
end

