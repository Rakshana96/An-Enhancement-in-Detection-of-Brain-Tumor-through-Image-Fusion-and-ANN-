function [c,s]=dwt_code(x,n)
n=1;%input('Select iteration how many times transform');
% figure,imshow(im,[]); 
lo_d=[0.7071 0.7071];
lo_h=[-0.7071 0.7071];
c = []; 
sx =  size(x);
s = zeros(n+2,length(sx));
s(end,:) = size(x);
for i=1:n
    [x,h,v,d] = dwt_manual(x,lo_d,lo_h); % decomposition
    c = [h(:)' v(:)' d(:)' c];     % store details
    s(n+2-i,:) = size(x);          % store size
end
c = [x(:)' c];
s(1,:) = size(x);

end
