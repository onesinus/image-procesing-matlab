image_path = "images";
image_files = dir(fullfile(image_path, '*.jpg'));

for i = 34:40 %numel(image_files)
    figure('Position', [100, 100, 1200, 800]);
    img = imread(fullfile(image_path, image_files(i).name));
    
    % Display D7_7_mean result
    subplot(1, 3, 1);
    imshow(D7_7_mean(img));
    title(['Mean: ', image_files(i).name]);
    
    % Display D7_7_min_max result
    subplot(1, 3, 2);
    imshow(D7_7_min_max(img));
    title(['Min Max: ', image_files(i).name]);
    
    % Display D7_7_median result
    subplot(1, 3, 3);
    imshow(D7_7_median(img));
    title(['Median: ', image_files(i).name]);
end
