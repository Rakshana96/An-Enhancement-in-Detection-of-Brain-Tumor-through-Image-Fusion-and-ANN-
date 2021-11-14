function [ass1,ass2,ass3,ass4]=kmeans_clustering(image)
level=4;D=20;
iter=10;
image=imresize(uint8(image),[200,200]);
image=double(image);
mini=double(min(min(image)'));
maxi=double(max(max(image)'));
pixelnum=zeros(1,maxi-mini+1);
interval=round((maxi-mini+1)/level);

for i=mini:maxi;
    pixelnum(i-mini+1)=length(find(image==i));
end
ini_centre=zeros(1,level);
for i=1:level-1;
    [a,b]=sort(pixelnum(1+(i-1)*interval:i*interval));
    ini_centre(i)=b(interval)+(i-1)*interval+mini-1;
end
[a,b]=sort(pixelnum(1+(level-1)*interval:maxi-mini+1));
    ini_centre(level)=b(maxi-mini-(level-1)*interval+1)+mini-1+(level-1)*interval;
  
for i=1:level-1;
    if (ini_centre(i+1)-ini_centre(i)<D)             
        ini_centre(i+1)=round((ini_centre(i+1)+ini_centre(i))/2);
        ini_centre(i)=0;
        i=i+1;
    end
end
%num=length(find(ini_centre>0));
%adj_centre=zeros(1,num);
adj_centre=ini_centre(find(ini_centre>0));
num=length(adj_centre); 

%%
final_centre=adj_centre;
adj_centre=round(final_centre);
image=double(image);
[R C]=size(image);
ass1=zeros(R,C);
ass2=zeros(R,C);
ass3=zeros(R,C);
ass4=zeros(R,C);
ass5=zeros(R,C);
ass6=zeros(R,C);
for i=1:R
for j=1:C
    r=image(i,j);
    ab=abs((image(i,j))-adj_centre);
    mn=find(ab==min(ab));
if mn(1)==1
ass1(i,j)=1;
end
if mn(1)==2
ass2(i,j)=1;
end
if mn(1)==3
ass3(i,j)=1;
end
if mn(1)==4
ass4(i,j)=1;
end
end
end
end