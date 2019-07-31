function[cluster] = AssignToClusters(image,means)
% Assigns each pixel in image to closest 3D RGB point from a series of mean
% colours
% Input: image - RGB 3D array of an image
%        means - RGB colour information of each mean(k,1,3)
% Output: cluster - cluster of same amount of columns and rows as image
% with each value corresponding to that pixels closest mean
% Author: Gemma Lowe

sizeImage = size(image);
sizeMeans = size(means,1);
distances = ones(sizeImage(1),sizeImage(2),sizeMeans); %Array to store distances between points

% Seperate layers of image and means into seperate arrays so easier and tidier to
% write distances line
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);

Rm=means(:,:,1);
Gm=means(:,:,2);
Bm=means(:,:,3);

for k = 1:sizeMeans(1) %Cycle through each mean colour
    % Create 3D array of all distances. Stores each set of distances between means on a new layer.
    distances(:,:,k) = (((R-Rm(k)).^2)+((G-Gm(k)).^2)+((B-Bm(k)).^2));
end

%Takes minimum value across 3rd dimension per 2D index and stores layer number
%into cluster array giving each pixels closest mean.
[~,cluster] = min(distances,[],3);
end