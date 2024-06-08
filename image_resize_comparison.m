fname = '14230003.jpg';
im1 = imageresize(fname, 2, 0); % nearest neighbor interpolation 
im2 = imageresize(fname, 2, 1); % Bilinear interpolation 
im3 = imageresize(fname, 2, 2); % Bicubic interpolation
original_image = imread(fname);

figure(1);
subplot(2, 2, 1);
imshow(original_image);
title("Sebelum Resize");

subplot(2, 2, 2);
imshow(im1);
title("nearest neighbor");

subplot(2, 2, 3);
imshow(im2);
title("Bilinear interpolation ");

subplot(2, 2, 4);
imshow(im3);
title("Bicubic interpolation");

figure(2);
subplot(2, 2, 1);
imhist(original_image);
title("Asli");

subplot(2, 2, 2);
imhist(im1);
title("nearest neighbor");

subplot(2, 2, 3);
imhist(im2);
title("Bilinear interpolation ");

subplot(2, 2, 4);
imhist(im3);
title("Bicubic interpolation");