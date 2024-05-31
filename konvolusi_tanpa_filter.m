function img_konvolusi = konvolusi_tanpa_filter(img_asli, kernel)
    img_asli = double(img_asli);
    [baris, kolom] = size(img_asli);
    img_konvolusi = zeros(baris, kolom);
    for i = 2:baris-1
        for j = 2:kolom-1
            temp = 0;
            for m = -1:1
                for n = -1:1
                    temp = temp + img_asli(i+m, j+n) * kernel(m+2, n+2);
                end
            end
            img_konvolusi(i,j) = temp;
        end
    end
end
