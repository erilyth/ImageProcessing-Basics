background = imread('background.jpg');
ufo = imread('ufo.jpg');

background = imresize(background, [500 500]);
ufo = imresize(ufo, [500 500]);

%Hue, Satuaration, Value
%0 to 1, 0 to 1, 0 to 1 -> 0 to 360, 0 to 255, 0 to 255
%Hue determines the colour, so a range of greens can be easily removed
%using hue, so we use hue instead of RGB.
hsv = rgb2hsv(ufo);

%Green indices
[greenIdxX, greenIdxY] = find(hsv(:,:,1) >= 100/360.0 & hsv(:,:,1) <= 120/360.0 & hsv(:,:,2)>=100/255.0 & hsv(:,:,3)>=100/255.0);

%UFO itself will be blednded with the background a bit to make it look
%better
finalImage = ufo .* 0.8 + background .* 0.2;
for i=1:size(greenIdxX)
    %Replace green pixels with background completely
    finalImage(greenIdxX(i), greenIdxY(i),:) = background(greenIdxX(i), greenIdxY(i),:);
end
imshow(finalImage);