function [ ] = writeRGBTIFF( rgb, filename )
    
    t_out = Tiff(filename,'w')
    tagstruct.ImageLength = size(rgb,1)
    tagstruct.ImageWidth = size(rgb,2)
    tagstruct.Photometric = Tiff.Photometric.RGB
    tagstruct.BitsPerSample = 16
    tagstruct.SamplesPerPixel = 3
    %tagstruct.RowsPerStrip = 16
    tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky
    %tagstruct.Software = 'Matlab'
    t_out.setTag(tagstruct)
    t_out.write(rgb)
    t_out.close();