% Read the image
img = imread('14230003.jpg');

% Convert to grayscale if it's not already
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Crop the image
cropped_img = imcrop(img, [160 140 1400 1400]);

figure;
imshow(cropped_img);
title('Cropped Image');

% Perform Unsharp Masking
blurred_img = imgaussfilt(cropped_img, 5); % Gaussian blur
unsharp_img = cropped_img + (cropped_img - blurred_img); % Add the difference to original image

figure;
imshow(unsharp_img);
title('Unsharp Masking Image');

% Perform High-Pass Filtering
low_pass_filter = fspecial('average', 5); % Create low pass filter
low_pass_img = imfilter(unsharp_img, low_pass_filter, 'replicate'); % Apply low pass filter
high_pass_img = unsharp_img - low_pass_img; % Subtract low-pass image from original to get high-pass image

% Adjust the contrast of the high-pass filtered image
high_pass_img = imadjust(high_pass_img);

figure;
imshow(high_pass_img);
title('High-Pass Filtered Image');

% Perform Image Segmentation using Otsu's method for thresholding
level = graythresh(high_pass_img);
binary_img = imbinarize(high_pass_img, level);

figure;
imshow(binary_img);
title('Thresholded Image');

% Perform watershed segmentation
D = -bwdist(~binary_img);
Ld = watershed(D);
bw2 = binary_img;
bw2(Ld == 0) = 0;

figure;
imshow(bw2);
title('Segmented Image');
