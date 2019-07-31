function[random_points] = SelectKRandomPoints(image,k)
% Creates a 2d array of slected 'k' amount of random points on a image
% Inputs : image - 3D array of points (image) to choose random points from
%          k - amount of random points required (single value)
% Outputs : random_points - 2D array (size = (k, 2)) representing the row and
%                           column of each selected point
% Author : Gemma Lowe

[rows, cols, ~] = size(image); %Maximum allowed values
%Selects random points from range 1 to max pixel size then converts the
%index value to subscript value
[rowPoint,colPoint] = ind2sub([rows cols], randperm(rows*cols, k));
%Creates random point array, conjoining the random row and column points
random_points = cat(2,transpose(rowPoint),transpose(colPoint));
end