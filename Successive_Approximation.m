% User input
enclosingWidth = input('Enter width: ');
enclosingHeight = input('Enter height: ');
percentageUnprotected = (input('Enter percentage of unprotected area: '))/100;
raditionIntensity = 84; %kW/m^2, manually input for now, 168 normal load, 84 reduced load

% View Factor Calculation
recalculatedRadiationIntensity = raditionIntensity * percentageUnprotected;
criticalRadiationIntensity = 12.6; %kW/m^2, compatibility for more will be added later
targetViewFactor = criticalRadiationIntensity / recalculatedRadiationIntensity;
disp(class(targetViewFactor));
% Final bonudary distance result
separationResult = separationDistanceCalculation(enclosingWidth, enclosingHeight, targetViewFactor);
boundaryDistance = separationResult/2;

% Printing results
fprintf('Minimum separation distance is %.*f m \n',3 , separationResult);
fprintf('The boundary distance is %.*f m ',3 , boundaryDistance);

function output = separationDistanceCalculation(a, b, c)

    % Initial Variables
    enclosingWidth = a;
    enclosingHeight = b;
    viewFactor = 0;
    targetViewFactor = round(c, 4);
    separationDistance = 0;
    % While loop failsafe
    maxIterationCount = 50000;
    iterationCount = 0;

    % Calculating correct separation distance

    % Rounds the calculated view factor to 4d.p to check if it is the correct
    % distance. Also contains the loop failsafe to ensure there is no infinite
    % loop occuring.
    while round(viewFactor, 4) ~= targetViewFactor && iterationCount < maxIterationCount

        % Neccessary calculations for view factor equiation
        X = enclosingWidth/(2*separationDistance);
        Y = enclosingHeight/(2*separationDistance);

        % View Factor equation
        viewFactor = (2/pi)*((X/sqrt(1+X*X))*atan(Y/sqrt(1+X*X))+(Y/sqrt(1+Y*Y))*atan(X/sqrt(1+Y*Y)));

        % Increases separation distance and count for each iteration
        separationDistance = separationDistance + 0.001;
        iterationCount = iterationCount + 1;

        % Displays relevant values for each iteration 
%         disp(iterationCount);
%         disp(viewFactor);
%         disp(separationDistance);
    end
    output = separationDistance;
    disp('Complete')

end


