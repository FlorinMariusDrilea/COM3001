% The 'Tank' class is responsible for storing parameters about the space
% As well as the nitrate concentration, the food amount and the
% ammonia level in the water
classdef Tank
    
    properties
        % Parameters of the tank
        tankParameters
        idCounter
        
        % Array stored as an array
        fish
        % Plants stored as an array
        plants
        % Harvested fish total number
        fishHarvestCounter
        % Harvested plant total number
        plantsHarvestCounter
        
        % Values in Mg
        ammonia
        nitrate        
        fishFood       
    end
    
    methods
        % From other scripts
        % Couting the total number of alive fish
        value = count_fish(this)
        % Feed the fish
        [this, fish] = feed_fish(this, fish)
        % Feed the plant
        [value, this] = feed_plant(this, plant)
        % Harvest the fish
        [this, fish] = harvest(this, fish)
        
        % Initialising the Tank constructor
        function this = Tank(tankParameters, startParameters)
            this.idCounter = 0;
            this.tankParameters = tankParameters;
            
            % 0 harvested fish
            this.fishHarvestCounter = 0;
            % 0 harvested plant
            this.plantsHarvestCounter = 0;
            
            % Ammonia level
            this.ammonia = startParameters.ammonia;
            % Nitrate concentration
            this.nitrate = startParameters.nitrate;
            % Amount of food
            this.fishFood = startParameters.fishFood;
        end
        
        function i = newID(this)
            % Increment the counter
            this.idCounter = this.idCounter + 1;
            % Return it as 'i'
            i = this.idCounter;
        end
        
        % Getting a free index (space) in the fish list
        function index = getFreeFishIndex(this)
            % The size, counting only the non-empty elements
            % As arrays are initialised with empties
            [~, n] = size(this.fish);
            % Check the boundaries
            if (n+1 > this.tankParameters.maxFish)
                index = -1;
            else
                index = n+1;
            end
        end
        
        % Getting a free index (space) in the plants list
        function index = getFreePlantIndex(this)
            % The size returns only the nuber of non-empty elements
            [~, n] = size(this.plants);
            if (n+1 > this.tankParameters.maxPlants)
                index = -1;
            else
                index = n+1;
            end
        end
        
        % Calculating the volume of water
        function value = volume(this)
            value = this.tankParameters.fish.tankVolume ...
                + this.tankParameters.plant.tankVolume;
        end
        
        % Adding the food for fish in the tank
        function this = addFood(this)
            this.fishFood = this.fishFood + this.tankParameters.fish.foodPerTimestep;
        end
        
        % Mass of plants
        function mass = plantsMassSum(this)
            mass = 0;
            for p=1:length(this.plants)
                if this.plants(p).status == STATUS.ALIVE
                    mass = mass + this.plants(p).size;
                end
            end
        end
        
        % Size of fish
        function value = FishSize(this)
            value = 0;
            for f=1:length(this.fish)
                if this.fish(f).status == STATUS.ALIVE
                    value = value + this.fish(f).size;
                end
            end
        end
        
        % Harvested fish
        function value = fishHarvested(this)
            value = this.fishHarvestCounter;
        end
        
        % Harvested plants
        function value = plantsHarvested(this)
            value = this.plantsHarvestCounter;
        end
        
        % Calculating the ammonia amount (level)
        % The sum of ammonia and the excreted value
        function this = addAmmonia(this, value)
            this.ammonia = this.ammonia + value;
        end
        
        % Calculating the unit for concentration as (Mg, ammonia) / (m^3, volume)
        function value = ammoniaConcentration(this)
            value = this.ammonia / this.volume();
        end
        function value = nitrateConcentration(this)
            value = this.nitrate / this.volume();
        end
    end
end