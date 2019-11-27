function [imageTensor] = fileLoader()
   
    imDir = '.\yalefaces\yalefaces\';
    S = dir(fullfile(imDir,'*.pgm'));
    imageTensor = zeros(243*320 ,11 , numel(S)/11);
    
    for k = 1:numel(S)/11
        for j = 1:11
            F = fullfile(imDir,S(k).name);
            I = imread(F);
            I = I(:);
            imageTensor(:,j,k) = im2double(I);
        end
    end
end

