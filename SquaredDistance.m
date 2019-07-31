function[distance] = SquaredDistance(point1, point2)
% Calculates the distance squared between 2 points in 3d space
% Input:point1 - Array containing one point in 3D space with RGB values
%       point2 - Array containing a second point in 3D space with RGB values
% Output: distance - The squared distance between 2 points in 3D space
% Author: Gemma Lowe

%Calculate squared distance between two vector points
distance = ((point1(1)-point2(1))^2)+((point1(2)-point2(2))^2)+((point1(3)-point2(3))^2);
end