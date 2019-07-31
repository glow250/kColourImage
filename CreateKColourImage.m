function[kImage] = CreateKColourImage(clusters, means)
%Takes array of cluster values for each pixel and the RGB value of each
%cluster and creates an RGB image
%Input : clusters - array with each indexes value coordinating to that pixels 
%        mean colour value
%        means - Mean RGB values for each pixel cluster
%Output : kImage - RGB image with k amount of colours
%Author : Gemma Lowe

means = round(means); %integers only
[row,col] = size(clusters);
k = size(means,1); %amount of means
[kImager, kImageg, kImageb] = deal(zeros(row,col,'uint8')); %Create array for each image layer

%Assure all values are within RGB value range
means(means>255)=255;
means(means<0)=0;

for meanValue = 1:k %Cycle through each mean colour
    %Change each pixel assigned to current mean value its RGB value
    kImager(clusters==meanValue) = means(meanValue,1,1);
    kImageg(clusters==meanValue) = means(meanValue,1,2);
    kImageb(clusters==meanValue) = means(meanValue,1,3);
end

% Combine the 3 rgb arrays into one image
kImage = cat(3,kImager,kImageg,kImageb);
end