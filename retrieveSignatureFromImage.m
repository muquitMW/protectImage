function Ir = retrieveSignatureFromImage(I)

if ~ismatrix(I)
    indI = mod(I(:,:,3),2)>0;
else 
    indI = mod(I,2)>0;
end

st = regionprops(indI, 'PixelList');
lx = st(1).PixelList(:,1);
rx = st(end).PixelList(:,1);
ly = st(1).PixelList(:,2);

szI = size(indI);
Ir = indI(max(min(ly) - 2,1) : min(max(ly) + 2, szI(1)), ...
    max(min(lx) - 2, 1) : min(max(rx) + 2, szI(2)));

end