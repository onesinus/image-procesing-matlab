%% Preprocessing

% Load the image
img = imread('14230003.jpg');

% Crop the image
cropped_img = imcrop(img, [160 140 1400 1400]);

% Show cropped image
figure;
imshow(cropped_img);
title('Cropped Image');

% Apply a Gaussian filter to reduce noise
filtered_img = imgaussfilt(cropped_img, 1.5);

% Enhance contrast
enhanced_img = imadjust(filtered_img);

% Show enhanced image
figure;
imshow(enhanced_img);
title('Enhanced Image');

%% Enhancement

% Define the structuring element
% se = strel('disk', 10);
se = strel('disk', 15);
% se = ones(5);

% Perform morphological erosion
eroded_img = imerode(enhanced_img, se);

% Show eroded image
figure;
imshow(eroded_img);
title('Eroded Image');

% Edge detection equation: E = filtered_img - eroded_img
edges = enhanced_img - eroded_img;

% Show edges
figure;
imshow(edges);
title('Edges');


%% Sharpen Edge

% Define the bit depth value (you can adjust this based on your image)
bitdepth = 8;

% Define the minimum multi-threshold value (you can adjust this based on your image)
T = 1;

% Sharpen edge equation: S(x, y) = bitdepth * E(x, y) / T
sharpened_edges = bitdepth * edges / T;

% Show sharpened edges
figure;
imshow(sharpened_edges);
title('Sharpened Edges');