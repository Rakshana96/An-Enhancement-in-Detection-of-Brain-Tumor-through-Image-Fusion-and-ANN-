function varargout = MAIN_GUI(varargin)
% MAIN_GUI MATLAB code for MAIN_GUI.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MAIN_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MAIN_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MAIN_GUI

% Last Modified by GUIDE v2.5 23-Mar-2018 18:56:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MAIN_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MAIN_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MAIN_GUI is made visible.
function MAIN_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MAIN_GUI (see VARARGIN)

% Choose default command line output for MAIN_GUI
handles.output = hObject;
a = ones(256,256);
axes(handles.axes1);
imshow(a);
axes(handles.axes8);
imshow(a);
axes(handles.axes9);
imshow(a);
axes(handles.axes10);
imshow(a);
axes(handles.axes11);
imshow(a);
axes(handles.axes12);
imshow(a);
set(handles.text2,'string',' ');
set(handles.text3,'string',' ');
set(handles.text4,'string',' ');
set(handles.text6,'string',' ');
set(handles.text7,'string',' ');
set(handles.text8,'string',' ');
% set(handles.axes3, 'Visible', 'off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MAIN_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MAIN_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
for i=1:2
[file,path]= uigetfile('*.*','Select Image');
if file~=0
    I=imread(strcat(path,file));  
    I=imresize(I,[256,256]);
    
%  if size(T,3)>1 
%          T=rgb2gray(T);
%  end
% if i==2
%    h = fspecial('gaussian',5,5); 
%      if size(I,3)>1 
%           I(:,:,1)=imfilter(I(:,:,1),h);
%           I(:,:,2)=imfilter(I(:,:,2),h);
%           I(:,:,3)=imfilter(I(:,:,3),h);
%      else
%        I=imfilter(I,h);
%      end 
% end

T(:,:,:,i)=I;
%     end
else
    warndlg('User pressed cancel');
end
end
%% 
 [r2,c2,d]=size(T(:,:,:,1));
im1=T(:,:,:,1);
im2=T(:,:,:,2);
% subplot(3,2,1),

   axes(handles.axes1),imshow(im1,[]);
   set(handles.text2,'string','ORIGINAL IMAGE1');
  %%

   axes(handles.axes8),imshow(im2,[]);
   set(handles.text3,'string','ORIGINAL IMAGE2'); 
 
%%  
    
handles.T=T;
handles.im=im2;
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.output = hObject;
% I=handles.test;

% %training
% A=questdlg('Which is your choise?', 'Type','training','already trained  ','training');
% % a=input('You want to train new feature press 1 or 2 for already trained features');
% if strcmp(A,'training')
    a=input('You want to train new feature press 1 or 2 for already trained features');
if a==1
 %%
 
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
   handles.in=traindata;
   handles.gp=traingroup;
   handles.in1=traindata1;
   handles.gp1=traingroup1;
   save trained
   
else
    load trained;
%     handles.in=traindata;
%     handles.gp=traingroup;
%     handles.in1=traindata1;
%    handles.gp1=traingroup1;
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = ones(256,256);
axes(handles.axes1);
imshow(a);
axes(handles.axes8);
imshow(a);
axes(handles.axes9);
imshow(a);
axes(handles.axes10);
imshow(a);
axes(handles.axes11);
imshow(a);
axes(handles.axes12);
imshow(a);
set(handles.text2,'string',' ');
set(handles.text3,'string',' ');
set(handles.text4,'string',' ');
set(handles.text6,'string',' ');
set(handles.text7,'string',' ');
set(handles.text8,'string',' ');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%  I=HE; 
I=handles.im;
J=otsuregion(I);  
    axes(handles.axes12),imshow(J,[]);
    set(handles.text8,'String','SEGMENTED IMAGE IMAGE'); 
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
 

handles.fea= feature;
handles.J=J;
guidata(hObject, handles);




% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

traingroup=handles.gp;
traindata=handles.in;
feature=handles.fea;
J=handles.J;
are=length(find(J))/size(J,1)*size(J,2);
net = newff(traindata,traingroup,50);
     net = train(net,traindata,traingroup);
     outputs = net(feature(:));
     if round(outputs)==1
       msgbox('This image having disease');
       
       if are<1000
           msgbox('First stage of Tumor ')
       end
       if are>1000 & are <2000
           msgbox('Second stage of Tumor ')
       end
       if are>2000 & are <3000
           msgbox('Third stage of Tumor ')
       end 
       if are>3000 
           msgbox('Fifth stage of Tumor ')
       end 
       
                    
   else
       msgbox('This image normal image');
     end
handles.feature=feature;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=handles.T;
im1=T(:,:,:,1);
im2=T(:,:,:,2);
% subplot(3,2,1),
[r2,c2,d]=size(T(:,:,:,1));
for jk=1:d
I1=im1(:,:,jk);
I2=im2(:,:,jk);

%% 2D DISCRETE WAVELET TRANSFORM
[y,z]=dwt_code(I1);

c(jk,:)=y;
s(:,:,jk)=z;

[y1,z1]=dwt_code(I2);
c1(jk,:)=y1;
s1(:,:,jk)=z1;

end
output=fusion_image(c,s,c1,s1);

%%
% subplot(3,2,3),


   axes(handles.axes9),wavegray(c(1,:),s(:,:,1),1,'append');
   set(handles.text4,'string','WAVELET OF IMAGE1');
  %%

   axes(handles.axes10),wavegray(c1(1,:),s1(:,:,1),1,'append')
   set(handles.text6,'string','WAVELET OF IMAGE2'); 
 
output=uint8(output);

% subplot(3,2,5),

axes(handles.axes11),imshow(uint8(output));
set(handles.text7,'string','FUSION OF TWO IMAGE 1 AND 2'); 
% figure,imshow(uint8(output));
% title('Fusion of Two images');
STD=std(double(output(:)))
[MSE,dPSNR] = psnr(I1,uint8(output))
%% RMSE

%RMSE Root Mean Squared Error
I1=im1;
err = sum((I1(:) - output(:)).^2)/length(I1(:));  % MSE
RMSE = sqrt(err)    
handles.fi=uint8(output);
% RMSE
guidata(hObject, handles);
