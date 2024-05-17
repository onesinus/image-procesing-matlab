% Define a range of SE sizes to try
se_sizes = 1:10;

% Initialize variables to store results
best_se_size = 0;
best_entropy = 0;

% Loop through each SE size
for size_val = se_sizes
    % Define the structuring element
    se = strel('disk', size_val);
    
    % Perform morphological erosion
    eroded_img = imerode(filtered_img, se);
    
    % Calculate image entropy
    entropy_val = entropy(eroded_img);
    
    % Update best SE size if entropy improves
    if entropy_val > best_entropy
        best_entropy = entropy_val;
        best_se_size = size_val;
    end
end

% Display the best SE size
fprintf('Best structuring element size: %d\n', best_se_size);