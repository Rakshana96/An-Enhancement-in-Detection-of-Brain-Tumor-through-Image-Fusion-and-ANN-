function final=training(directory)

       file=dir(directory);
for i1=3:length(file)
    
       filename=[directory '\' file(i1).name];
       I=imread(filename);
       if size(I,3)==3
           I=rgb2gray(I); 
       end
       I=imresize(I,[256,256]);
       I=double(I);
%%
       
       HE = double(histeq(uint8(I))); 
%       I=HE; 
      J=otsuregion(I); 
%%
      GLCM2 = graycomatrix(J,'Offset',[2 0;0 2]);
      out = GLCM_Features(GLCM2,0);
      feature(1,:)=out.maxpr;
      feature(2,:)=out.energ;
      feature(3,:)=out.entro;
      feature(4,:)=out.contr;
      feature(5,:)=out.dissi;
      feature(6,:)=out.homom;  
      feature(7,:)=out.idmnc;
      final(i1-2,:)=feature(:);
      
end
end