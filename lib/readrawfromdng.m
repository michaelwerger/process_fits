function [ raw ] = readrawfromdng( filename )
t = Tiff(filename,'r');,
%%%
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets);
raw = read(t);

end

