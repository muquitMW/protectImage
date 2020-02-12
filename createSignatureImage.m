function In = createSignatureImage(I,signText, fontsize)
%This function creates an image containing the signature text (signature image) as white letters on a black background
%Inputs
% I : original image
% signText: Texts of the signature to be added
% fonsize: Size of letters for the signature
%Outputs
%In : signature image

%% Initial operation
bI      = zeros(size(I));%blank background image
position= [10 size(I,1)/2-10 size(I,2)*0.8 size(I,1)*0.3];%adding 1 to positions of the letters

%% Adding signature
In      = insertObjectAnnotation(bI,...
    'rectangle',...
    position,...
    signText,...
    'Color',[0 0 0],...
    'TextColor',[1 1 1],...
    'FontSize',fontsize);

In      = rgb2gray(In);%Gray image
In      = In >=1;%
In      = cast(In,'like',I);%Adjust to input image's type
end
