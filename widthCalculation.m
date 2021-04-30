function output = widthCalculation(a, b, c)

    % Initial Variables
    enclosingHeight = a;
    separationDistance = b;
    viewFactor = 0;
    targetViewFactor = round(c, 4);
    enclosingWidth = 0;
    % While loop failsafe
    maxIterationCount = 100000;
    iterationCount = 0;

    % Calculating width

    % Rounds the calculated view factor to 3d.p to check if it is the correct
    % distance. Also contains the loop failsafe to ensure there is no infinite
    % loop occuring.
    while round(viewFactor, 4) ~= targetViewFactor && iterationCount < maxIterationCount

        % Neccessary calculations for view factor equiation
        X = enclosingWidth/(2*separationDistance);
        Y = enclosingHeight/(2*separationDistance);

        % View Factor equation
        viewFactor = (2/pi)*((X/sqrt(1+X*X))*atan(Y/sqrt(1+X*X))+(Y/sqrt(1+Y*Y))*atan(X/sqrt(1+Y*Y)));

        % Increases approximated enclosing width and count for each iteration
        enclosingWidth = enclosingWidth + 0.001;
        iterationCount = iterationCount + 1;
    end
    output = round(enclosingWidth, 3);
end