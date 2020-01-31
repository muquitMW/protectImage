function In = createSignatureImage(I,signText, fontsize)
%% ��������
bI      = zeros(size(I));%��̔w�i�i���j�摜���쐬
position= [10 size(I,1)/2-10 size(I,2)*0.8 size(I,1)*0.3];%�����̈ʒu���w��

%% ������}��
In      = insertObjectAnnotation(bI,...
    'rectangle',...
    position,...
    signText,...
    'Color',[0 0 0],...
    'TextColor',[1 1 1],...
    'FontSize',fontsize);

In      = rgb2gray(In);%�O���[�摜
In      = In >=1;%�s�N�Z���l���u1�v�����̃s�N�Z���̒l���O�ɖ߂�
In      = cast(In,'like',I);%�����摜�̌^�����摜�ƍ��킹��

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