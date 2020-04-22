% This class implements abstract Agent methods for the Plant type
% intake(tank), output(tank), and behaviour(tank)
% and provides implementations for other Plant behaviours


% 'Plant' class is a subclass of the 'Agent' class
%
%
classdef Plant < Agent
    
    %Parameters
    properties
        % The parameters for a plant
        plantParams
        minNitrateConcentration
        
        
        % Fields
        nitrateIntake
        nitrateRequest
        harvestSize
    end
    
    methods
        % The constructor for a plant
        function plant = Plant(id, plantParams)
            
            % Call the superclass (Agent's) constructor
            plant = plant@Agent(id, plantParams.growCoefficient, ...
                plantParams.startNutrition, plantParams.nutritionDecay);
            % Harvest size
            plant.harvestSize = plantParams.harvestSize;
            % Minimum nitrate concentration
            plant.minNitrateConcentration = plantParams.minNitrateConcentration;
            % Plant parameters
            plant.plantParams = plantParams;
        end
        
        % It is called at the start of each timestep
        % Amonia and food from the tank
        function [this, tank] = intake(this, tank)
            % The age
            this.ageOneDay();
            
            % The nitrate from the tank
            [this.nitrateIntake, tank] = tank.feed_plant(this);
        end
       
        % Calculating the growth for each day
        function value = growRate(this)
            value = this.growCoefficient * this.nitrateIntake;
        end
        
        % Excrete, output waste or nutrients
        function [this, tank] = output(this, tank)
        end
        
        % Grow, be harvested,  die, kill, be harvested
        function [this, tank] = behaviour(this, tank)
            % Reduced growth caused by nitrate concentration that is
            % beneath the required leve
            stuntGrowth = min(1, tank.nitrateConcentration() / this.minNitrateConcentration);
            deltaSize = stuntGrowth * this.growRate();
            deltaSize = normrnd(deltaSize, 0.5);
            this = grow(this, deltaSize);
            
            % Check if harvested
            if (this.size >= this.harvestSize)
                [tank, this] = tank.harvest_plant(this);
            end
        end
    end
    
end