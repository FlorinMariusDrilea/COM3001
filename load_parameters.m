% Parameters
function parameters = load_parameters()
    % Display all values as graphics
    parameters.displayGraphical = true;
    parameters.displayEvery = 10;
    parameters.iterativeGraphs = false;
    
    % Assign initial values
    startparameters.fish = 100;
    startparameters.plants = 10;
    startparameters.fishFood = 1;
    startparameters.ammonia = 10;
    startparameters.nitrate = 10;

    % Parameters of tank
    tankparameters.fish.foodPerTimestep = startparameters.fish * 0.15;
    tankparameters.fish.tankVolume = 10;    
    tankparameters.plant.tankVolume = 10;
    tankparameters.fish.maxPerCubicMetre = 100;
    tankparameters.plant.maxPerCubicMetre = 10;

    % Parameters of fish
    % Variance 
    fishparameters.foodValueStdDev = 0.05;
    % deltaSize = growCoefficient * foodValue
    fishparameters.growCoefficient = 0.7;
    fishparameters.harvestSize = 150;
    % How much a fish is eating
    fishparameters.eatCoefficient = 0.02;
    fishparameters.startNutrition = 1;
    fishparameters.nutritionDecay = 0.15;
    % Rate of food intake that is converted into excrete
    fishparameters.excreteRate = 0.75;
    fishparameters.reproducingAge = 30 * 5;
    fishparameters.reproducingLikelihood = 0.15;
    % Starving threshold for nutrition
    fishparameters.cannibalThreshold = 0.1;
    % Size of fish that could be able to be eaten
    fishparameters.cannibalSizeCoefficient = 0.5;
    % Threshold of ammonia for dying
    fishparameters.ammoniaThreshold = 50;
    % Threshold for standard deviation of ammonia threshold
    fishparameters.ammoniaThreshStdDev = 10;

    % Parameters of plants
    plantparameters.harvestSize = 200;
    plantparameters.startNutrition = 1;
    plantparameters.nutritionDecay = 0.2;
    plantparameters.growCoefficient = 5;
    plantparameters.minNitrateConcentration = 1;
    
    % Parameters of bacteria
    bacteriaparameters.convertRate = 40 * tankparameters.fish.tankVolume;
    bacteriaparameters.maxNitrateConcentration = 100;

    % Limits for every parameter 
    % (maximum of fish and plants depeding on the tank)
    tankparameters.maxFish = tankparameters.fish.tankVolume ...
                            * tankparameters.fish.maxPerCubicMetre;
    tankparameters.maxPlants = tankparameters.plant.tankVolume ...
                            * tankparameters.plant.maxPerCubicMetre;

    % Assigned initial values cannot be 
    % bigger that the maximum of fish and plants
    tankparameters.fish.startCounter = min(startparameters.fish, tankparameters.maxFish);
    tankparameters.plant.startCounter = min(startparameters.plants, tankparameters.maxPlants);
    
    % Return all parameters   
    parameters.startparameters = startparameters;
    parameters.tankparameters = tankparameters;
    parameters.fishparameters = fishparameters;
    parameters.plantparameters = plantparameters;
    parameters.bacteriaparameters = bacteriaparameters;

end