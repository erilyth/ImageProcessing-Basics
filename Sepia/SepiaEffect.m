im = double(imread('bike.jpg'));

imTexture = imread('texture2.jpg');
imTexture = imresize(imTexture, [size(im,1) size(im,2)]);
%Range it between 0 and 1
imTexture = double(rgb2gray(imTexture))/255.0;

R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

finR = (R * .293) + (G * .769) + (B * .210);
finG = (R * .249) + (G * .686) + (B * .188);
finB = (R * .172) + (G * .534) + (B * .151);

finalImg(:,:,1) = finR .* imTexture;
finalImg(:,:,2) = finG .* imTexture;
finalImg(:,:,3) = finB .* imTexture;

%Convert doubles to integers in the range 0 to 255
imshow(uint8(finalImg));