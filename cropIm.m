function [out] = cropIm(im)

    im = im2double(im);
    subplot(1,3,1);
    imshow(im)
    mask = (im > 0.3 & im < 0.8);
    
    %Morphology
    se1 = strel('disk',5);
    se2 = strel('disk', 65);
    mask = imopen(mask,se1);
    mask = imclose(mask,se2);
    
    %Apply mask
    im = im.*mask;
    
    subplot(1,3,2);
    imshow(mask);
    subplot(1,3,3);
    imshow(im);
    out = im;

end

