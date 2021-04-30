function output = unprotectedAreaCalculation(a, b, c, d)

    % Initial Variables
    enclosingHeight = a;
    enclosingWidth = b;
    separationDistance = c;
    radiationIntensity = d;
    criticalRadiationIntensity = 12.6;

    X = enclosingWidth/(2*separationDistance);
    Y = enclosingHeight/(2*separationDistance);

    % View Factor equation
    viewFactor = (2/pi)*((X/sqrt(1+X*X))*atan(Y/sqrt(1+X*X))+(Y/sqrt(1+Y*Y))*atan(X/sqrt(1+Y*Y)));

    recalculatedRadiationIntenisty = criticalRadiationIntensity/viewFactor;
    
    unprotectedArea = recalculatedRadiationIntenisty/radiationIntensity;
    
    output = round(unprotectedArea*100, 3);
end