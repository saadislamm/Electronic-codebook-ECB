clear all;
clc;

fid = fopen('circle_encrypted.x');
ecbfull = fread(fid, '*uint8');

padding=14;     cols=435;    rows=349;
unheadpadaes = ecbfull(401:end-padding);

length(unheadpadaes)
unheadbmp = unheadpadaes(55:end);
l=length(unheadbmp);
unheadbmp = reshape(unheadbmp,l/rows,rows);

for i = 0:3:cols*3-1
    a(:,i/3+1) = fliplr(unheadbmp(i+3,:));
    b(:,i/3+1) = fliplr(unheadbmp(i+2,:));
    c(:,i/3+1) = fliplr(unheadbmp(i+1,:));
end

I(:,:,1)=a;
I(:,:,2)=b;
I(:,:,3)=c;

imshow(I);
imwrite(I, 'circle_encrypted.bmp');