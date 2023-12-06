% Returns the directed angle between the two given angles;
% all inputs and outputs are in units of pi.
% Inputs in range [0,2), output in range [-1,1]
% Positive for clockwise, negative for counterclockwise

function phi = DirAngle(theta1, theta2)
    phi = theta2 - theta1;
    if phi > 1    % directed angle is instead negative
        phi = phi - 2;
    elseif phi < -1    % directed angle is instead positive
        phi = phi + 2;
    end
end