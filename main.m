function main()
close all;
%%
  load trained;
%training
a=input('You want to train new feature press 1 or 2 for already trained features');
if a==1
 %%
 clear traindata;
   diry=[pwd '\' 'with_disease'];
   disp('training disease image features.....');
   feature1=training(diry);
   diry=[pwd '\' 'without_disease'];
   disp('training without disease image features.....');
   feature2=training(diry);
   l1=size(feature1,1);
   l2=size(feature2,1);
   traindata(:,1:l1)=feature1';
   traindata(:,(l1+1):l1+l2)=feature2';
   traindata1(:,1:l1)=feature1';
   traindata1=traindata1+10;
   traindata1(:,(l1+1):l1+l2)=feature2';
   g1=ones(1,l1);
   g2=ones(1,l2)*2;
   traingroup1=[repmat('1',[1,l1]),repmat('2',[1,l2])];
   traingroup=[g1 g2];
   clear diry
   clear g1
   clear g2
   clear l2
   clear l1
   clear feature1
   clear feature2
   save trained
end
   %%
    [file,path]=uigetfile('*.jpg','Select input image');
	I=imread(strcat(path,file));
    Io=I;
    
       if size(I,3)==3
           I=rgb2gray(I); 
       end
       I=imresize(I,[256,256]);
       I=double(I); 
   subplot(2,2,1),imshow(I,[]);
   title('ORIGINAL IMAGE');
  %%
%     HE = double(I);
    HE = double(histeq(uint8(I))); 
   subplot(2,2,2),imshow(HE,[]);
   title('ENHANCED IMAGE'); 
 
%%  
%  I=HE; 
J=otsuregion(I);
%         f(1)=length(find(ass1==1));
%         f(2)=length(find(ass2==1));
%         f(3)=length(find(ass3==1));
%         f(4)=length(find(ass4==1));
%         s=find(f==0);
%         f(s)=1111111111;
%         result{1}=ass1;
%         result{2}=ass2;
%         result{3}=ass3;
%         result{4}=ass4;
%        
%         
% [a b]=min(f);
% J=result{b}; 
    subplot(2,2,3),imshow(J,[]);
   title('SEGMENTED IMAGE IMAGE'); 
%    figure,
%     subplot(2,2,1),imshow(ass1);
%      subplot(2,2,2),imshow(ass2);
%       subplot(2,2,3),imshow(ass3);
%        subplot(2,2,4),imshow(ass4);
%    %%
   GLCM2 = graycomatrix(J,'Offset',[2 0;0 2]);
      out = GLCM_Features(GLCM2,0);
      feature(1,:)=out.maxpr;
      feature(2,:)=out.energ;
      feature(3,:)=out.entro;
      feature(4,:)=out.contr;
      feature(5,:)=out.dissi;
      feature(6,:)=out.homom;  
      feature(7,:)=out.idmnc;
  feature
  
     net = newff(traindata,traingroup,50);
     net = train(net,traindata,traingroup);
     outputs = net(feature(:));
     if round(outputs)==1
       msgbox('This image having disease');
       feature=feature+10;
   else
       msgbox('This image normal image');
     end
   
   
   net1 = parzenPNNlearn(traindata1,traingroup1);
   class = parzenPNNclassify(net1,feature(:));
   if class=='1'
       msgbox('This image having disease');
      
   else
       msgbox('This image normal image');
    end
   
end






