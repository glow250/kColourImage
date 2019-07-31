function[clusters, means] = KMeansRGB(image, means, iterations)
% Function to seperate pixels of an image into k clusters and give RGB mean
% values for each cluster
% Input: image - RGB 3D array of an image
%        means - Orignial set of means
%        iterations - Maximum number of iterations to run
% Output: clusters - Array specifing what means each pixel belongs to
%         means - Mean RGB values for each cluster of pixels
% Author: Gemma Lowe

k = size(means,1); %Amount of clusters
numLoops = 0; %Count loops

for loop = 1:iterations %Only run code for maximum amount of times as specified iterations
    clusters = AssignToClusters(image, means); %Create array of each pixels closest mean
    oldMeans = means; %Store old means before updating means array
    means = UpdateMeans(image, k, clusters);%Returns new mean values
    if oldMeans==means %Check if convergence reached
        disp('Maximum number of iterations reached before convergence was achieved');
        break %Convergence reached before maximum iterations (stop loop).
    end
    numLoops = numLoops+1; %Update loops count
end
end