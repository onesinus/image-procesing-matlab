function [HFBF_Image] = High_Boost_Filt(Original_Image, h_size,Sigma,A)
% Create a gaussian filter (blurring_image)
GLPF = fspecial('gaussian',h_size,Sigma);

% Apply a gaussian low pass filter on the Input_Image
GLPF_Image = imfilter(Original_Image,GLPF);
% figure(),imshow(GLPF_Image);
% title('Gaussian Low Pass Filtered Image');

% Apply High Pass Filter on Input_Image 
% High_pass_filter = Original_Image - GLPF_Image;

% Unsharpened Image is when A = 1
% Unsharpened_Image = (1*Original_Image) + High_pass_filter;
% figure(),imshow(Unsharpened_Image);
% title('Unsharpened Image');

% We can implement the above formula of high boost filtering in 3 ways 
% First one is in function and rest are commented   

% Multiply (A>1) in masked image for high boost filtering
HFBF_Image = (A-1)*Original_Image + Original_Image - GLPF_Image;
% figure(),imshow(HFBF_Image);
% title('High Frequency Boosted Image');


% figure(),imshowpair(Original_Image,HFBF_Image,'montage')
% title("Original Image High Boost Image")

end