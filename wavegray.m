function w = wavegray(c,s,scale,border)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
absflag=scale<0;
scale=abs(scale);
if scale ==0;
    scale=1;
end

[cd,w]=wavework('cut','a',c,s,1);
w=mat2gray(w);
cdx=max(abs(cd(:)))/scale;
if absflag
    cd=mat2gray(abs(cd),[0,cdx]);
    fill=0;
else
    cd=mat2gray(cd,[-cdx,cdx]);
    fill=0.5;
end

for i=size(s,1)-2:-1:1
    ws=size(w);
    
    h=wavework('copy','h',cd,s,i);
    pad=ws-size(h);
    frontporch=round(pad/2);
    h=padarray(h,frontporch,fill,'pre');
    h=padarray(h,pad-frontporch,fill,'post');
    
    v=wavework('copy','v',cd,s,i);
    pad=ws-size(v);
    frontporch=round(pad/2);
    v=padarray(v,frontporch,fill,'pre');
    v=padarray(v,pad-frontporch,fill,'post');
    
    d=wavework('copy','d',cd,s,i);
    pad=ws-size(d);
    frontporch=round(pad/2);
    d=padarray(d,frontporch,fill,'pre');
    d=padarray(d,pad-frontporch,fill,'post');
    
    %¼Ó±ß½ç
   switch lower(border)
       case 'append'
           w=padarray(w,[1 1],1,'post');
           h=padarray(h,[1 0],1,'post');
           v=padarray(v,[0 1],1,'post');
       case 'absorb'
           w(:,end)=1;
           w(end,:)=1;
           h(end,:)=1;
           v(:,end)=1;
       otherwise
           error('unrecognized border parameter.');
   end
   w=[w,h;v,d];
end

if nargout==0;
    imshow(w,[]);
end


end

