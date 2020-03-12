% Params
function params = load_parameters()
    % Display all values as graphics
    params.displayGraphical = true;
    params.displayEvery = 10;
    params.iterativeGraphs = false;
    
    % Assign initial values
    startParams.fish = 100;
    startParams.plants = 10;
    startParams.fishFood = 1;
    startParams.ammonia = 10;
    startParams.nitrate = 10;

    % Parameters of tank
    tankParams.fish.foodPerTimestep = startParams.fish * 0.15;
    tankParams.fish.tankVolume = 10;    
    tankParams.fish.maxPerCubicMetre = 100;
    tankParams.plant.tankVolume = 10;
    tankParams.plant.maxPerCubicMetre = 10;

    % Parameters of fish
    % Variance 
    fishParams.foodIntakeStdDev = 0.05;
    % How much a fish is eating
    fishParams.eatCoeff = 0.02;
    fishParams.startNutrition = 1;
    fishParams.nutritionDecay = 0.15;
    % deltaSize = growCoeff * foodIntake
    fishParams.growCoeff = 0.5;
    fishParams.harvestSize = 100;
    % Rate of food intake that is converted into excrete
    fishParams.excreteRate = 0.75;
    fishParams.reproduceAge = 30 * 5; %
    fishParams.reproduceProb = 0.1;
    % Starving threshold for nutrition
    fishParams.cannibalThreshold = 0.1;
    % Size of fish that could be able to be eaten
    fishParams.cannibalSizeCoeff = 0.5;
    % Threshold of ammonia for dying
    fishParams.ammoniaThreshold = 50;
    % Threshold for standard deviation of ammonia threshold
    fishParams.ammoniaThreshStdDev = 10;

    % Parameters of plants
    plantParams.harvestSize = 150;
    plantParams.startNutrition = 1;
    plantParams.nutritionDecay = 0.2;
    plantParams.growCoeff = 5;
    plantParams.minNitrateConc = 1;
    
    % Parameters of bacteria
    bacteriaParams.convertRate = 30 * tankParams.fish.tankVolume;
    bacteriaParams.maxNitrateConc = 100;

    % Limits for every parameter 
    % (maximum of fish and plants depeding on the tank)
    tankParams.maxFish = tankParams.fish.tankVolume ...
                            * tankParams.fish.maxPerCubicMetre;
    tankParams.maxPlants = tankParams.plant.tankVolume ...
                            * tankParams.plant.maxPerCubicMetre;

    % Assigned initial values cannot be 
    % bigger that the maximum of fish and plants
    tankParams.fish.startCount = min(startParams.fish, tankParams.maxFish);
    tankParams.plant.startCount = min(startParams.plants, tankParams.maxPlants);
    
    % Return all parameters   
    params.startParams = startParams;
    params.tankParams = tankParams;
    params.fishParams = fishParams;
    params.plantParams = plantParams;
    params.bacteriaParams = bacteriaParams;

end
