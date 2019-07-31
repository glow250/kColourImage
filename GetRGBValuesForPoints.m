function[colours] = GetRGBValuesForPoints(picture, rp)
%When given the 'x, y' values of points on a image this function retrieves
%the RGB values for these given points.
%Input : picture - A 3D image array which RGB points are found from
%        rp - points on picture in a k by 2 array where column 1 is
%        row index and column 2 is column index
%Output : colours - A (k, 1, 3) array which stores k amount of RGB values
%Author : Gemma Lowe

k = size(rp,1); %Establish variable for amount of random points
colours = zeros(k,1,3);

%Retrieve RGB value from position of each pixel
for row = 1:k %Cycle through amount of points to get each point
    for layer = 1:3 %Cycle through each RGB value to retrieve
        %Store each colour for point in colours array
        colours(row,1,layer) = picture(rp(row,1), rp(row,2), layer);
    end
end
end