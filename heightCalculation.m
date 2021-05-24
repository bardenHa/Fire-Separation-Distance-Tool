function output = heightCalculation(a, b, c)

    % Initial Variables
    enclosingWidth = a;
    separationDistance = b;
    viewFactor = 0;
    targetViewFactor = round(c, 4);
    enclosingHeight = 0;
    % While loop failsafe
    maxIterationCount = 100000;
    iterationCount = 0;

    % Calculating height 

    % Rounds the calculated view factor to 3d.p to check if it is the correct
    % distance. Also contains the loop failsafe to ensure there is no infinite
    % loop occuring.
    while round(viewFactor, 4) ~= targetViewFactor && iterationCount < maxIterationCount

        % Neccessary calculations for view factor equiation
        X = enclosingWidth/(2*separationDistance);
        Y = enclosingHeight/(2*separationDistance);

        % View Factor equation
        viewFactor = (2/pi)*((X/sqrt(1+X*X))*atan(Y/sqrt(1+X*X))+(Y/sqrt(1+Y*Y))*atan(X/sqrt(1+Y*Y)));

        % Increases approximated enclosing height and count for each iteration
        enclosingHeight = enclosingHeight + 0.001;
        iterationCount = iterationCount + 1;
    end
    output = round(enclosingHeight, 3);
end