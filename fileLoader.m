function [imageTensor] = fileLoader()
   
    imDir = '.\yalefaces\yalefaces\';
    S = dir(fullfile(imDir,'*.pgm'));
    imageTensor = zeros(243, 320, numel(S));
    
    for k = 1:numel(S)
        F = fullfile(imDir,S(k).name);
        I = imread(F);
        imageTensor(:,:,k) = im2double(I);
    end
end

