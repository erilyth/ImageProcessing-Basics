%Contrast
i = imread('pout.tif');
K = imadjust(i, [0.3 0.75], [0 1]);
figure, imshow(K);

%Edge detection
I = rgb2gray(imread('eiffel.jpg'));
E = edge(I, 'canny');
figure, imshow(E);
