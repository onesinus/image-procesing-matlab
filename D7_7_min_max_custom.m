function [G]= D7_7_min_max_custom(fn)
% F = imread(fn);
F=fn;
Ukuran = size(F);
tinggi = Ukuran(1);
lebar = Ukuran(2);
G = F;

% Tx(18)=0;

for baris = 4 : tinggi-4
    for kolom = 4 : lebar-4
        Tx(1) = F(baris-1, kolom);
        Tx(2) = F(baris+1, kolom);

        Tx(3) = F(baris-2, kolom+1);
        Tx(4) = F(baris-2, kolom);
        Tx(5) = F(baris-2, kolom-1);

        Tx(6) = F(baris+2, kolom-1);
        Tx(7) = F(baris+2, kolom);
        Tx(8) = F(baris+2, kolom+1);

        Tx(9) = F(baris-3, kolom+2);
        Tx(10) = F(baris-3, kolom+1);
        Tx(11) = F(baris-3, kolom);
        Tx(12) = F(baris-3, kolom-1);
        Tx(13) = F(baris-3, kolom-2);

        Tx(14) = F(baris+3, kolom-2);
        Tx(15) = F(baris+3, kolom-1);
        Tx(16) = F(baris+3, kolom);
        Tx(17) = F(baris+3, kolom+1);
        Tx(18) = F(baris+3, kolom+2);

        Tn(1) = F(baris, kolom+1);
        Tn(2) = F(baris-1, kolom+1);
        Tn(3) = F(baris-1, kolom-1);
        Tn(4) = F(baris, kolom-1);
        Tn(5) = F(baris+1, kolom-1);
        Tn(6) = F(baris+1, kolom+1);

        Tn(7) = F(baris, kolom+2);
        Tn(8) = F(baris-1, kolom+2);
        Tn(9) = F(baris-2, kolom+2);
        Tn(10) = F(baris-2, kolom-2);

        Tn(11) = F(baris-1, kolom-2);
        Tn(12) = F(baris, kolom-2);
        Tn(13) = F(baris+1, kolom-2);
        Tn(14) = F(baris+2, kolom-2);
        Tn(15) = F(baris+2, kolom+3);

        Tn(16) = F(baris+2, kolom+2);
        Tn(17) = F(baris, kolom+3);
        Tn(18) = F(baris-1, kolom+3);
        Tn(19) = F(baris-2, kolom+3);
        Tn(20) = F(baris-3, kolom+3);

        Tn(21) = F(baris-1, kolom-3);
        Tn(22) = F(baris-1, kolom-3);
        Tn(23) = F(baris-1, kolom-3);
        Tn(24) = F(baris, kolom-3);
        Tn(25) = F(baris+1, kolom-3);
        Tn(26) = F(baris+2, kolom-3);
        Tn(27) = F(baris+3, kolom-3);

        Tn(28) = F(baris+3, kolom+3);
        Tn(29) = F(baris+2, kolom+3);
        Tn(30) = F(baris+11, kolom+3);

        
        % Average
        total_nilai_n = 0;
        total_nilai_x = 0;

        for i = 1 : 18
            if Tx(i)
                total_nilai_x = total_nilai_x + Tx(i);
            end
        end

        for i = 1 : 30
            if Tn(i)
                total_nilai_n = total_nilai_n + Tn(i);
            end
        end

        Tn = total_nilai_n / length(Tn); % nilai_rata_rata_n
        Tx = total_nilai_x / length(Tx); % nilai_rata_rata_x

        % Mengganti nilai piksel
        if G(baris, kolom) < Tn
        	G(baris, kolom) = Tn;
        else
        	if G(baris, kolom) > Tx
        		G(baris, kolom) = Tx;
        	end
        end
    end
end