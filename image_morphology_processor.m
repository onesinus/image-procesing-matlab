image_path = "images";
image_files = dir(fullfile(image_path, '*.jpg'));

for i = 34:40 %numel(image_files)
    figure('Position', [100, 100, 1200, 800]);
    img = imread(fullfile(image_path, image_files(i).name));
    
    % Apply edge detection using morphology to D7_7_mean result
    subplot(1, 3, 1);
    Im1 = D7_7_mean(img); % Filtered image
    SE = strel("diamond", 7);
    Im2 = imdilate(Im1, SE);
    Im3 = imerode(Im1, SE);
    Im4 = Im2 - Im3;
    imshow(Im4);
    title(['Mean ED: ', image_files(i).name]);
    
    % Apply edge detection using morphology to D7_7_min_max result
    subplot(1, 3, 2);
    Im1 = D7_7_min_max(img); % Filtered image
    Im2 = imdilate(Im1, SE);
    Im3 = imerode(Im1, SE);
    Im4 = Im2 - Im3;
    imshow(Im4);
    title(['Min Max ED: ', image_files(i).name]);
    
    % Apply edge detection using morphology to D7_7_median result
    subplot(1, 3, 3);
    Im1 = D7_7_median(img); % Filtered image
    Im2 = imdilate(Im1, SE);
    Im3 = imerode(Im1, SE);
    Im4 = Im2 - Im3;
    imshow(Im4);
    title(['Median ED: ', image_files(i).name]);
end
