fname = '14230003.jpg';
im1 = lci_enlarge(fname);
original_image = imread(fname);

figure(1);
subplot(2, 2, 1);
imshow(original_image);
title("Asli");

subplot(2, 2, 2);
imshow(im1);
title("Setelah Enlarge LCI");

subplot(2, 2, 3);
imhist(original_image);
title("Asli Histogram");

subplot(2, 2, 4);
imhist(im1);
title("LCI Histogram");
