function [MSE,PSNR] = psnr(ImageA,ImageB)

% if (size(ImageA,1) ~= size(ImageB,1)) or (size(ImageA,2) ~= size(ImageB,2))
%     error('ImageA <> ImageB');
%     dPSNR = 0;
%     return ;
% end
ImageA=double(ImageA);
ImageB=double(ImageB);
M = size(ImageB,1);
N = size(ImageB,2);
    
d = 0 ;
for i = 1:M
    for j = 1:N
        d = d + (ImageA(i,j) - ImageB(i,j)).^2 ;
    end
end
MSE=(d/(M*N));
PSNR = 20*log10((M*N*max(max(ImageA.^2)))/d) ;

return
