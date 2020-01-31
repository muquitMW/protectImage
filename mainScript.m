%% Define inputs
I = imread('pears.png');
signText = 'Don Quixote';
fontsize = 25;

%% Create Signature
sigI = createSignatureImage(I,signText, fontsize);

%% Embed Signature
Iimp = implantSignatureIntoImage(I, sigI);
msgbox('Your signature has been embedded in the input image', 'Implant Success!');

%% Display
subplot(1,2,1), imshow(I), title('Original Image')
subplot(1,2,2), imshow(Iimp),title('Signature Embedded Image (Any difference?)')

%% Retrieve signature from a given image
Ir = retrieveSignatureFromImage(Iimp);

%% Match retrieved signature with a given signature
try
    Result = normxcorr2(double(Ir), double(sigI));
    if max(Result(:)) > 0.95
        msgbox('Your signature hasbeen verified in the input image', 'Verified!');
    else
        msgbox('Could not verify your signature ', 'Rejected!');
    end
catch
    msgbox('Could not verify your signature ', 'Rejected!');
end