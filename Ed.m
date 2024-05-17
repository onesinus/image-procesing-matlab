function [Im4] = Ed(img)    
    SE = strel("diamond", 7);
    Im2 = imdilate(img, SE);
    Im3 = imerode(img, SE);
    Im4 = Im2 - Im3;