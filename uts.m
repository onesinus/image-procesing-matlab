% Pre-Processing (Filter)
img = imread('14230003.jpg');
Im1=D7_7_min_max_custom(img);
subplot(1, 3, 1);
imshow(Im1)

% Edge Detection (Morphology) Dilation – Erosion strel (Diamond , 7)
SE = strel("diamond",7);
Im2 = imdilate(Im1,SE);
Im3 = imerode(Im1,SE);
Im4 = Im2 - Im3;
subplot(1, 3, 2);
imshow(Im4)

% Enhancement
Im5 = Enh(Im4);
subplot(1, 3, 3);
imshow(Im5)