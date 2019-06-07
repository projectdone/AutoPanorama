function [img_b] = mymosaic(img_input, order_list)

    N = numel(img_input);
    img_b = img_input{order_list(1)};

    % stitch images according to order_list
    for i = 2:1:N
        img_i = img_input{order_list(i)};
        img_b = stitch(img_i, img_b);
    end

end


% stitch img_i to img_b and return the mosaic all together
function [img_b] = stitch(img_i, img_b)

    [boxFeatures, boxPoints] = get_features(img_i);
    [sceneFeatures, scenePoints] = get_features(img_b);

    boxPairs = matchFeatures(boxFeatures, sceneFeatures);
    matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
    matchedScenePoints = scenePoints(boxPairs(:, 2), :);

    x_i = matchedBoxPoints.Location(:,1);
    y_i = matchedBoxPoints.Location(:,2);
    x_b = matchedScenePoints.Location(:,1);
    y_b = matchedScenePoints.Location(:,2);

    % reject outliers     
    [H, inlier_ind] = ransac_est_homography(x_i, y_i, x_b, y_b, 10);

    img_b = map_pairs(H, img_i, img_b);

end
