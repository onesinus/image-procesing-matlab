% Fungsi ketetanggaan untuk operasi filter dengan 8 tetangga
function [G] = ketetanggaan(fn)
    F = imread(fn);
    Ukuran = size(F);
    tinggi = Ukuran(1);
    lebar = Ukuran(2);

    G = F;
    for baris = 2 : tinggi-1
        for kolom = 2 : lebar-1
            % Mengambil nilai piksel tetangga
            tetangga = [F(baris-1, kolom-1) F(baris-1, kolom) F(baris-1, kolom+1) ...
                        F(baris, kolom-1)     F(baris, kolom)     F(baris, kolom+1)   ...
                        F(baris+1, kolom-1) F(baris+1, kolom) F(baris+1, kolom+1)];

            % Operasi yang diaplikasikan (dalam hal ini min, max, median, rata-rata)
            minPiksel = min(tetangga);
            maksPiksel = max(tetangga);
            medianPiksel = median(tetangga);
            rataPiksel = mean(tetangga);

            % Memperbarui nilai piksel berdasarkan operasi yang dipilih
            G(baris, kolom, 1) = minPiksel; % Untuk min
            G(baris, kolom, 2) = maksPiksel; % Untuk max
            G(baris, kolom, 3) = medianPiksel; % Untuk median
            G(baris, kolom, 4) = rataPiksel; % Untuk rata-rata
        end
    end
end
