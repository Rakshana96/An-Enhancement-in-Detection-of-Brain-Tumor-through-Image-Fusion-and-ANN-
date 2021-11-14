% Matlab code for Image Fusion using Averaging Method

clc;

clear all;

close all;

 

M1 = imread('set21.gif');

M2 = imread('set22.gif');

M1=double(M1);

M2=double(M2);

FusedImage=(M1 + M2) / 2;

subplot(1,3,1);imshow(uint8(M1),[ ]);
title('High Image');

subplot(1,3,2);imshow(uint8(M2),[ ]);
title('Low Image');

subplot(1,3,3);imshow(uint8(FusedImage),[ ]);title('Image Fusion using Averaging');


%% Matlab code for Image Fusion using Maximum Method


mm = M1 > M2;

FusedImage = (mm.*M1) + ((~mm).*M2);

figure,
subplot(1,3,1);imshow(uint8(M1),[ ]);
title('High Image');

subplot(1,3,2);imshow(uint8(M2),[ ]);
title('Low Image');

subplot(1,3,3);imshow(uint8(FusedImage),[ ]);title('Image Fusion using MAXimum');

%% Matlab code for Image Fusion using Minimum Method

 


mm = M1 < M2;

FusedImage = (mm.*M1) + ((~mm).*M2);
figure,
subplot(1,3,1);imshow(uint8(M1),[ ]);
title('High Image');

subplot(1,3,2);imshow(uint8(M2),[ ]);
title('Low Image');

subplot(1,3,3);imshow(uint8(FusedImage),[ ]);
title('Image Fusion using Minimum');
