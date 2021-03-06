clear all
close all
A=[16,11,10,16,24,40,51,61;
12,12,14,19,26,58,60,55;
14,13,16,24,40,57,69,56;
14,17,22,29,51,87,80,62;
18,22,37,56,68,109,103,77;
24,35,55,64,81,104,113,92;
49,64,78,87,103,121,120,101;
72,92,95,98,112,100,103,99 ];
image=imread('lena512.pgm'); %to read the image
figure(1);
imshow(image); %to show the image
hold on;
img_var=double(image); % to represent an image as real variable
siz=size(img_var);
M=siz(1);
N=siz(2);
quantized=zeros(M,N);
reconstructed=zeros(M,N);
q = 10;
S = s_eval(q);
b8=1:1:8;
M1=M/8; % n. of vertical blocks in image
N1=N/8; % n. of horizontal blocks in image
for i_row=0:M1-1;
for i_col=0:N1-1;
block=img_var(i_row*8+b8,i_col*8+b8);
block_dct=dct2(block); 
block_dct_qt=round(block_dct./(S*A)); 
quantized(i_row*8+b8,i_col*8+b8) = block_dct_qt; 
block_dct_dqt=block_dct_qt.*A*S; 
block_dct_dqt_idct=idct2(block_dct_dqt); 
reconstructed(i_row*8+b8,i_col*8+b8)=block_dct_dqt_idct; 
end
end