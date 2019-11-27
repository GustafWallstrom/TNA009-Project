function [imageTensor] = fileLoader()

    imDir = '.\orl_faces\s'; %'.\yalefaces\yalefaces\';
    imgSize = 92*112;
    expression = 10;
    people = 40;
    imageTensor = zeros( imgSize , expression ,people);
    
    for k = 1:people
         S = dir(fullfile(strcat(imDir, num2str(k)),'*.pgm'));
        for j = 1:expression
            F = fullfile(strcat(imDir, num2str(k)),S(j).name);
            I = imread(F);
            I = I(:);
            imageTensor(:,j,k) = im2double(I);
        end
    end
end

