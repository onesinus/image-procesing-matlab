function [G] = Objdet(img)
    F = img;
    Ukuran = size(F);
    tinggi = Ukuran(1);
    lebar = Ukuran(2);
    for i =  1 : tinggi
        for j = 1 : lebar
            G(i,j) = 0;
            if (F(i,j) >= 60) && (F(i,j) <=150)
                G(i,j) = F(i,j);
            end
        end
    end