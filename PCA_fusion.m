function RGB1=PCA_fusion(up,low,ch,ch1)

if ch==1
    
    RGB1=PCA_fusion_gray(up,low,ch1);
else



[up_R]=double(up(:,:,1));
[up_G]=double(up(:,:,2));
[up_B]=double(up(:,:,3));

[low_R]=double(low(:,:,1));
[low_G]=double(low(:,:,2));
[low_B]=double(low(:,:,3));

[M,N,color]=size(up);

up_Mx = 0;
low_Mx=0;
for i = 1 : M
    for j = 1 : N
         up_S = [up_R(i,j),up_G(i,j),up_B(i,j)]'; 
         up_Mx = up_Mx + up_S;
         
         low_S = [low_R(i,j),low_G(i,j),low_B(i,j)]';
         low_Mx = low_Mx + low_S;
    end
end
up_Mx = up_Mx / (M*N);   
low_Mx = low_Mx / (M*N);

up_Cx = 0;
low_Cx=0;
for i = 1 : M
    for j = 1 : N
         up_S = [up_R(i,j),up_G(i,j),up_B(i,j)]';
         up_Cx = up_Cx + up_S*up_S'; 
         
         low_S = [low_R(i,j),low_G(i,j),low_B(i,j)]';
         low_Cx = low_Cx + low_S*low_S';
    end
end

up_Cx = up_Cx / (M * N)- up_Mx*up_Mx';          
low_Cx = low_Cx / (M * N)- low_Mx*low_Mx'; 

[up_A,up_latent] = eigs(up_Cx); 
[low_A,low_latent] = eigs(low_Cx);

for i = 1 : M
    for j = 1 : N
       up_X = [up_R(i,j),up_G(i,j),up_G(i,j)]';        
       up_Y = up_A'*up_X;                              
       up_Y = up_Y';
       up_R(i,j) = up_Y(1);                            
       up_G(i,j) = up_Y(2);                            
       up_B(i,j) = up_Y(3);                            
       
       low_X = [low_R(i,j),low_G(i,j),low_G(i,j)]';
       low_Y = low_A'*low_X;
       low_Y = low_Y';
       low_R(i,j) = low_Y(1);                         
       low_G(i,j) = low_Y(2);                          
       low_B(i,j) = low_Y(3);                          
   end
end

for i = 1 : M
    for j = 1 : N
       up_Y = [up_R(i,j),up_G(i,j),up_B(i,j)]';         
       up_X = up_A*up_Y;                                
       up_X = up_X';
       up_r(i,j) = up_X(1);
       up_g(i,j) = up_X(2);
       up_b(i,j) = up_X(3);
       
       low_Y = [up_R(i,j),low_G(i,j),low_B(i,j)]';
       low_X = low_A*low_Y;
       low_X = low_X';
       low_r(i,j) = low_X(1);
       low_g(i,j) = low_X(2);
       low_b(i,j) = low_X(3);
   end
end
%RGB(:,:,1)=up_r;
%RGB(:,:,2)=up_g;
%RGB(:,:,3)=up_b;

RGB(:,:,1)=low_r;
RGB(:,:,2)=low_g;
RGB(:,:,3)=low_b;
% fusion start
if ch1==1
RGB1 = 0.5*(up+low);
end

if ch1==2
D = (abs(up)-abs(low))>=0;
RGB1 = D.*up + (~D).*low;
end
if ch1==3
D = (abs(up)-abs(low))>=0;
RGB1 = D.*up + (~D).*low;
end
if ch1==4
D = (abs(up)-abs(low))>=0;
RGB1 = D.*up + (~D).*low;
end
end
end


