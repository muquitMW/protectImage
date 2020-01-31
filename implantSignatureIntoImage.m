function I = implantSignatureIntoImage(I, sigI)
if ~ismatrix(I)
    Itmp        = I(:,:,3);
else
    Itmp        = I;
end

ind         = mod(Itmp,2)>0;
Itmp(ind)   = Itmp(ind) - 1;% Deduct 1 from the lowest bit

if ~ismatrix(I)
    I(:,:,3)    = Itmp + sigI;
else
    I           = Itmp + sigI;
end
end