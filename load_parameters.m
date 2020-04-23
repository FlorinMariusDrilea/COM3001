% Parameters
function parameters = load_parameters()
    % Display all values as graphics
    parameters.displayGraphical = true;
    parameters.displayEvery = 10;
    parameters.iterativeGraphs = false;
    
    % Assign initial values
    startParameters.fish = 100;
    startParameters.plants = 10;
    startParameters.fishFood = 1;
    startParameters.ammonia = 10;
    startParameters.nitrate = 10;

    % Parameters of tank
    tankParameters.fish.foodPerTimestep = startParameters.fish * 0.15;
    tankParameters.fish.tankVolume = 10;    
    tankParameters.plant.tankVolume = 10;
    tankParameters.fish.maxPerCubicMetre = 100;
    tankParameters.plant.maxPerCubicMetre = 10;

    % Parameters of fish
    % Variance 
    fishParameters.foodValueStdDev = 0.05;
    % deltaSize = growCoefficient * foodValue
    fishParameters.growCoefficient = 0.7;
    fishParameters.harvestSize = 150;
    % How much a fish is eating
    fishParameters.eatCoefficient = 0.02;
    fishParameters.startNutrition = 1;
    fishParameters.nutritionDecay = 0.15;
    % Rate of food intake that is converted into excrete
    fishParameters.excreteRate = 0.75;
    fishParameters.reproducingAge = 30 * 5;
    fishParameters.reproducingLikelihood = 0.15;
    % Starving threshold for nutrition
    fishParameters.cannibalismThreshold = 0.1;
    % Size of fish that could be able to be eaten
    fishParameters.cannibalismSizeCoefficient = 0.5;
    % Threshold of ammonia for dying
    fishParameters.ammoniaThreshold = 50;
    % Threshold for standard deviation of ammonia threshold
    fishParameters.ammoniaThreshStdDev = 10;

    % Parameters of plants
    plantParameters.harvestSize = 200;
    plantParameters.startNutrition = 1;
    plantParameters.nutritionDecay = 0.2;
    plantParameters.growCoefficient = 5;
    plantParameters.minNitrateConcentration = 1;
    
    % Parameters of bacteria
    bacteriaParameters.convertRate = 40 * tankParameters.fish.tankVolume;
    bacteriaParameters.maxNitrateConcentration = 100;

    % Limits for every parameter 
    % (maximum of fish and plants depeding on the tank)
    tankParameters.maxFish = tankParameters.fish.tankVolume ...
                            * tankParameters.fish.maxPerCubicMetre;
    tankParameters.maxPlants = tankParameters.plant.tankVolume ...
                            * tankParameters.plant.maxPerCubicMetre;

    % Assigned initial values cannot be 
    % bigger that the maximum of fish and plants
    tankParameters.fish.startCounter = min(startParameters.fish, tankParameters.maxFish);
    tankParameters.plant.startCounter = min(startParameters.plants, tankParameters.maxPlants);
    
    % Return all parameters   
    parameters.startParameters = startParameters;
    parameters.tankParameters = tankParameters;
    parameters.fishParameters = fishParameters;
    parameters.plantParameters = plantParameters;
    parameters.bacteriaParameters = bacteriaParameters;

end