image_path = "images_diabetic_retinopathy";
image_files = dir(fullfile(image_path, '*.jpg'));

for i = 1 : 10
    filename = strcat("images_diabetic_retinopathy/", num2str(i), '.jpg');
    img = imread(filename);
    
    figure(i); % works
    % Apply enlarge image algorithm
    % subplot(2, 2, 1);
    Im1 = lci_enlarge(filename);
    % imshow(Im1);
    % title('Enlarged Image');
    
    % Apply preprocessing (filter using min max algorithm)
    % subplot(2, 2, 2);
    Im2 = filter_min_max_rgb(Im1); % works
    % imshow(Im2);
    % title('Filtered Image');
    
    % Apply enhancement algorithm with spesific pixel range
    % subplot(2, 2, 3);
    Im3 = Enh_rgb(Im2); % works
    % imshow(Im3);
    % title('Enhanced Image');
    
    % Apply convolution algorithm
    % subplot(2, 2, 4);
    
    kernel = [-2 -1 0; -1 1 1; 0 1 2];
    Img4 = konvolusi_tanpa_filter_rgb(Im3, kernel);
    imshow(Img4);
    % title('Img after convolution');
end