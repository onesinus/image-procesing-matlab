function [G]=D7_7_min_max(fn)
% F = imread(fn);
F=fn;
Ukuran = size(F);
tinggi = Ukuran(1);
lebar = Ukuran(2);
G = F;
Temp(48)=0;

for baris = 4 : tinggi-4
    for kolom = 4 : lebar-4
        % Memasukkan nilai piksel tetangga ke dalam array Temp
        Temp(1) = F(baris, kolom+1);
        Temp(2) = F(baris-1, kolom+1);
        Temp(3) = F(baris-1, kolom);
        Temp(4) = F(baris-1, kolom-1);
        Temp(5) = F(baris, kolom-1);
        Temp(6) = F(baris+1, kolom-1);
        Temp(7) = F(baris+1, kolom);
        Temp(8) = F(baris+1, kolom+1);
        Temp(9) = F(baris, kolom+2);
        %T10
        %T11
        %T12
        Temp(13) = F(baris-2, kolom);
        %T14
        %T15
        %T16
        Temp(17) = F(baris, kolom-2);
        %T18
        %T19
        %T20
        Temp(21) = F(baris+2, kolom);
        %T22
        %T23
        %T24
        Temp(25) = F(baris, kolom+3);
        %T26
        %T27
        %T28
        %T29
        %T30
        Temp(31) = F(baris-3, kolom);
        %T32
        %T33
        %T34
        %T35
        %T36
        Temp(37) = F(baris, kolom-3);
        %T38
        %T39
        %T40
        %T41
        %T42
        Temp(43) = F(baris+3, kolom);
        %T44
        %T45
        %T46
        %T47
        %T48

        % Min Max
        nilai_minimum = 255;
        for i = 1 : 48
		    if nilai_minimum > Temp(i)
			    nilai_minimum = Temp(i);
		    end
        end
	
	    nilai_maksimum = 0;
        for i = 1 : 48
            if nilai_maksimum < Temp(i)
                nilai_maksimum = Temp(i);
            end
        end
        
        % Mengganti nilai piksel pada titik tengah dengan nilai min max
        if G(baris, kolom) < nilai_minimum
        	G(baris, kolom) = nilai_minimum;
        else
        	if G(baris, kolom) > nilai_maksimum
        		G(baris, kolom) = nilai_maksimum;
        	end
        end
    end
end