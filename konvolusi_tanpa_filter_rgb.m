function img_konvolusi = konvolusi_tanpa_filter_rgb(img_asli, kernel)
    img_asli = double(img_asli);
    [baris, kolom, ~] = size(img_asli);  % Get dimensions of the RGB image
    img_konvolusi = zeros(baris, kolom, 3);  % Initialize output matrix

    % Iterate through each pixel (excluding borders)
    for i = 2:baris-1
        for j = 2:kolom-1
            % Initialize temporary variables for each color channel
            temp_R = 0;
            temp_G = 0;
            temp_B = 0;

            % Perform convolution for each color channel
            for m = -1:1
                for n = -1:1
                    % Accumulate weighted sum for each channel
                    temp_R = temp_R + img_asli(i+m, j+n, 1) * kernel(m+2, n+2);
                    temp_G = temp_G + img_asli(i+m, j+n, 2) * kernel(m+2, n+2);
                    temp_B = temp_B + img_asli(i+m, j+n, 3) * kernel(m+2, n+2);
                end
            end

            % Assign the convolved value to the output image
            img_konvolusi(i,j,1) = temp_R;
            img_konvolusi(i,j,2) = temp_G;
            img_konvolusi(i,j,3) = temp_B;
        end
    end

    img_konvolusi = uint8(img_konvolusi);  % Convert back to uint8 for image display
end