function seg=otsuregion(img)

e = find(img>170);
mask = zeros(size(img));
mask(e) = 255;
% Region erosion through math morph
se = strel('disk',3);
maskErode = imerode(mask,se);
% Hysteresis thresholding
maskHyst = hysteresis(mask,maskErode);
% Fill holes through math morpho
maskFill = imfill(maskHyst,'holes');
% Region closing through math morpho
se = strel('disk',1);
final = imclose(maskFill,se);

%%
% X = ind2rgb(X,map);

     IDX = otsu(img,2);
out1=find(IDX==1);
out2=find(IDX==2);
IDX(out1)=0;
IDX(out2)=1;
final=im2bw(final);
IDX=im2bw(IDX);
seg=final.*IDX;
end