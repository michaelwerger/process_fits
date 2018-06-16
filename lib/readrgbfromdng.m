function [ rgb ] = readrgbfromdng( filename )
t = Tiff(filename,'r');,
%%%
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets);
raw = read(t);
min(min(raw))
max(max(raw))
rgb = demosaic(uint16(raw),'rggb');
end

