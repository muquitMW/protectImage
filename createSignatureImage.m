function In = createSignatureImage(I,signText, fontsize)
%This function creates an image containing the signature text as white letters on a black background
%Inputs
% I : original image
% signText: Texts of the signature to be added
% fonsize: Size of letters for the signature
%Outputs
%In : Image with signature

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

%% Inputs
% signText = 'Mohammad Muquit';
% fontsize = 24;

% %%
% fgH = figure('Visible', 'off');
% axes('Parent', fgH, 'xticklabel', [], 'yticklabel',[]);
% text(0.1, 0.1, signText, 'Fontsize', fontsize);
% 
% %% 
% I = getframe;
% close(fgH);
% I = I.cdata(:,:,1);
% I = I <= 0;
% 
% %%
% szI = size(I);
% I = I(1:end - round(szI(1)*0.05), round(szI(2)*0.05):end);
% 
% %%
% st = regionprops(I, 'PixelList');
% lx = st(1).PixelList(:,1);
% rx = st(end).PixelList(:,1);
% ly = st(1).PixelList(:,2);
% 
% %%
% In = I(max(min(ly) - 3,1) : min(max(ly) + 3,szI(1)), max(min(lx) - 3,1) : min(max(rx) + 3,szI(2)));
