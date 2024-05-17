% Edge Detection -> Filter -> Enhancement
img = imread('14230003.jpg');

figure(2);
Im1 = Ed(img); % Edge Detection
subplot(1, 3, 1);
imshow(Im1)

Im2 = D7_7_median(Im1); % Filter
subplot(1, 3, 2);
imshow(Im2)

% Im3 = Enh(Im2); %Enhancement
Im3 = High_Boost_Filt(Im1, 256, 0.5, 7); %Enhancement using high boost

subplot(1, 3, 3);
imshow(Im3)