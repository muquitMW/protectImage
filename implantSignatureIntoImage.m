function I = implantSignatureIntoImage(I, sigI)
%This function combines original image and signature images together
%Inputs
% I : original image
% sigI: signature image
%Outputs
%I : combined image

% For color image, the signature is put into BLUE image
if ~ismatrix(I)
    Itmp        = I(:,:,3);
else
    Itmp        = I;
end

% Deducts 1 from the lowest bit from input image
ind         = mod(Itmp,2)>0;
Itmp(ind)   = Itmp(ind) - 1;

% Adds signature image to input image
if ~ismatrix(I)
    I(:,:,3)    = Itmp + sigI;
else
    I           = Itmp + sigI;
end
end
