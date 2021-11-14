function output=fusion_image(as,bs,as1,bs1)


for i=1:size(as,1)
    
    c=as(i,:);
    s=bs(:,:,i);
    c1=as1(i,:);
    s1=bs1(:,:,i);
rmax = size(s,1);
nmax = rmax-2;
% Initialization.
nl   = s(1,1);
nc   = s(1,2);
a    = zeros(nl,nc);
a(:) = c(1:nl*nc);
% Iterated reconstruction.
rm   = rmax+1;

%%
lo_d=[0.7071 0.7071];
lo_h=[-0.7071 0.7071];
% Initialization.
nl1   = s1(1,1);
nc1   = s1(1,2);
a1    = zeros(nl1,nc1);
a1(:) = c1(1:nl1*nc1);
%%
ab(:,:,i)=a;
ab1(:,:,i)=a1;

for p=nmax:-1:1
    [h(:,:,i),v(:,:,i),d(:,:,i)] = detcoef_manual(c,s,p);
    [h1(:,:,i),v1(:,:,i),d1(:,:,i)] = detcoef_manual(c1,s1,p);
     
    
end

end
%%
     a2=PCA_fusion(ab,ab1,size(as,1),1);
     h2=PCA_fusion(h,h1,size(as,1),2);
     v2=PCA_fusion(v,v1,size(as,1),3);
     d2=PCA_fusion(d,d1,size(as,1),4);
     for i=1:size(as,1)
     output (:,:,i)= idwt_manual(a2(:,:,i),h2(:,:,i),v2(:,:,i),d2(:,:,i),lo_d,-lo_h,s(rm-1,:));
end
end