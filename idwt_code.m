function a=idwt_code(c,s)


lo_d=[0.7071 0.7071];
lo_h=[-0.7071 0.7071];
rmax = size(s,1);
nmax = rmax-2;
% Initialization.
nl   = s(1,1);
nc   = s(1,2);
a    = zeros(nl,nc);
a(:) = c(1:nl*nc);
% Iterated reconstruction.
rm   = rmax+1;
for p=nmax:-1:1
    [h,v,d] = detcoef_manual(c,s,p);
    a = idwt_manual(a,h,v,d,lo_d,-lo_h,s(rm-p,:));
end

end