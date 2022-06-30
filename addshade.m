function addshade(pos,limy,color)

ns = size(pos,1);
for i_=1:ns
    x_points = [pos(i_,1), pos(i_,1), pos(i_,2), pos(i_,2)];  
    y_points = [limy(1), limy(2), limy(2), limy(1)];
    a = fill(x_points, y_points, color);
    a.FaceAlpha = 0.1;
    a.EdgeColor = 'none';
end


end