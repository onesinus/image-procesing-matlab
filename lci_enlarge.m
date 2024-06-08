function [b] = lci_enlarge(fc)
a=imread(fc);
information= imfinfo(fc);
colortype = information.ColorType;
if colortype == 'truecolor'
    [x y z]=size(a);
    b = cast(zeros(x+x-1, y+y-1, z),'uint8');
    for i=1:x
        for j=1:y
            k=i+i-1;
            l=j+j-1;
            for m=1:3
                b(k,l,m)=a(i,j,m);
            end
        end
    end
    for j=1:y+y-1
        for i=1:x+x-1
            if rem (i,2) == 0
                for m=1:3
                    b(i,j,m)= round(((b(i-1,j,m)/2)-1)+(b(i+1,j,m)/2));
                end
            end
        end
    end
    for i=1:x+x-1
        for j=1:y+y-1
            if rem (j,2) == 0
	for m=1:3
b(i,j,m)= round(((b(i,j-1,m)/2)-1)+(b(i,j+1,m)/2));
                end
            end
        end
    end
else
    [x y]=size(a);
    b = cast(zeros(x+x-1, y+y-1),'uint8');
    for i=1:x
        for j=1:y
            k=i+i-1;
            l=j+j-1;
            b(k,l)=a(i,j);
        end
    end
    for j=1:y+y-1
        for i=1:x+x-1
            if rem (i,2) == 0
                b(i,j)= round(((b(i-1,j)/2)-1)+(b(i+1,j)/2));
            end
        end
    end
    for i=1:x+x-1
        for j=1:y+y-1
            if rem (j,2) == 0
               b(i,j)= round(((b(i,j-1)/2)-1)+(b(i,j+1)/2));
            end
        end
    end
end
