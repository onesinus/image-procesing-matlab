function G = filter_min_max_rgb(img)
    F = img;
    [tinggi, lebar, ~] = size(F);  % Get dimensions of the RGB image

    G = uint8(zeros(tinggi, lebar, 3));  % Initialize output matrix

    % Apply min-max filter
    for i = 5 : tinggi-4
        for j = 5 : lebar-4
            % Extract neighborhood for each channel
            neighborhood_red = F(i-1:i+1, j-1:j+1, 1);
            neighborhood_green = F(i-1:i+1, j-1:j+1, 2);
            neighborhood_blue = F(i-1:i+1, j-1:j+1, 3);

            % Calculate min and max for each channel
            min_red = min(neighborhood_red, [], 'all');
            max_red = max(neighborhood_red, [], 'all');
            min_green = min(neighborhood_green, [], 'all');
            max_green = max(neighborhood_green, [], 'all');
            min_blue = min(neighborhood_blue, [], 'all');
            max_blue = max(neighborhood_blue, [], 'all');

            % Apply min-max filter to each channel
            G(i, j, 1) = uint8(min(max(F(i, j, 1), min_red), max_red));
            G(i, j, 2) = uint8(min(max(F(i, j, 2), min_green), max_green));
            G(i, j, 3) = uint8(min(max(F(i, j, 3), min_blue), max_blue));
        end
    end
end
