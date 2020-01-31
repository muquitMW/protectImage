function In = createSignatureImage(I,signText, fontsize)
%% 初期処理
bI      = zeros(size(I));%空の背景（黒）画像を作成
position= [10 size(I,1)/2-10 size(I,2)*0.8 size(I,1)*0.3];%署名の位置を指定

%% 署名を挿入
In      = insertObjectAnnotation(bI,...
    'rectangle',...
    position,...
    signText,...
    'Color',[0 0 0],...
    'TextColor',[1 1 1],...
    'FontSize',fontsize);

In      = rgb2gray(In);%グレー画像
In      = In >=1;%ピクセル値が「1」未満のピクセルの値を０に戻す
In      = cast(In,'like',I);%署名画像の型を元画像と合わせる

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