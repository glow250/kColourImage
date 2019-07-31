function[updatedMeans] = UpdateMeans(image, k, clusters)
% Function to calculate new mean values from the mean calculation of each
% cluster of RGB pixels assigned to previous mean categories
% Input: image - RGB 3D array of image
%        k - a single value of the number of means
%        clusters - 2D array same size as 2D layer of image with values
%        coordinating to each pixels cluster mean
% Output: updatedMeans - 3D array of new mean RGB values(k,1,3)
% Author: Gemma Lowe

updatedMeans = zeros(k,1,3);
%Seperate image colour layers into seperate arrays
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);

for meanValue = 1:k %Cycle through means
    % Make a mask with a logical array to know which indexes belong to
    % current cluster value for loop
    indexes = clusters==meanValue;
    % Apply mask to each image colour layer returning only colour values
    % that are assigned to current cluster and calculate new mean from these,
    % store new mean in same position as old but in updated means matrix.
    updatedMeans(meanValue,1,1) = mean(R(indexes));
    updatedMeans(meanValue,1,2) = mean(G(indexes));
    updatedMeans(meanValue,1,3) = mean(B(indexes));
end
end