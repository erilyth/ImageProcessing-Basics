im = imread('logo.jpg');
imInvFin = imadjust(im, [], [1 0]);

cropShift = 3;
%Shift original image down by a bit
%Crop bottom part of the image and add it to the top
imTop = imcrop(im, [0 0 size(im,2) cropShift]);
imBot = imcrop(im, [0 cropShift+1 size(im,2) size(im,1)-cropShift]);
%Append along first dimension (rows)
imOrigFin = [imBot;imTop];

%Shift original image left a bit 
%Crop left part of the image and add it to the right
imLeft = imcrop(imOrigFin, [0 0 cropShift size(im,1)]);
imRight = imcrop(imOrigFin, [cropShift+1 0 size(im,2)-cropShift size(im,1)]);
%Append along second dimension (columns)
imOrigFin = [imRight imLeft];

imFinal = imOrigFin .* 0.5 + imInvFin .* 0.5;
imshow(imFinal);