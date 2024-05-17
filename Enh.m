function [G] = Enh(img)
    F = img;
    Ukuran = size(F);
    tinggi = Ukuran(1);
    lebar = Ukuran(2);
    for i =  1 : tinggi
        for j = 1 : lebar
            if (F(i,j) >= 15) && (F(i,j) <=39)
                G(i,j) = F(i,j) + 150;
            else
                G(i,j) = 0;
            end
        end
    end