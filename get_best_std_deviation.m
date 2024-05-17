% Define a range of standard deviations to try
std_devs = 1:0.5:5;

% Initialize variables to store results
best_std_dev = 0;
best_entropy = 0;

% Loop through each standard deviation
for std_dev = std_devs
    % Apply Gaussian filter
    filtered_img = imgaussfilt(cropped_img, std_dev);
    
    % Calculate image entropy
    entropy_val = entropy(filtered_img);
    
    % Update best standard deviation if entropy improves
    if entropy_val > best_entropy
        best_entropy = entropy_val;
        best_std_dev = std_dev;
    end
end

% Display the best standard deviation
fprintf('Best standard deviation: %.2f\n', best_std_dev);