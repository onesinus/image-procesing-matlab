function G = Enh_rgb(img)
    % Convert image to double precision for accurate calculations
    F = double(img);
    [tinggi, lebar, ~] = size(F);  % Get dimensions of the image

    G = zeros(tinggi, lebar, 3);  % Initialize output matrix for RGB image

    for i = 1 : tinggi
        for j = 1 : lebar
            % Extract RGB values
            R = F(i,j,1);  % Red channel
            G_val = F(i,j,2);  % Green channel
            B = F(i,j,3);  % Blue channel

            % Adjust each channel separately
            if (G_val >= 100) && (G_val <= 200)
                G(i,j,1) = min(255, R + 50);  % Adjust red channel, capped at 255
                G(i,j,2) = min(255, G_val + 50);  % Adjust green channel, capped at 255
                G(i,j,3) = min(255, B + 50);  % Adjust blue channel, capped at 255
            else
                G(i,j,1) = R;  % Preserve original red channel
                G(i,j,2) = G_val;  % Preserve original green channel
                G(i,j,3) = B;  % Preserve original blue channel
            end
        end
    end

    G = uint8(G);  % Convert back to uint8 for image display
end