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
        minNitrateConc
        
        
        % Fields
        nitrateIntake
        nitrateRequest
        harvestSize
    end
    
    methods
        % The constructor for a plant
        function plant = Plant(id, plantParams)
            
            % Call the superclass (Agent's) constructor
            plant = plant@Agent(id, plantParams.growCoeff, ...
                plantParams.startNutrition, plantParams.nutritionDecay);
            % Harvest size
            plant.harvestSize = plantParams.harvestSize;
            % Minimum nitrate concentration
            plant.minNitrateConc = plantParams.minNitrateConc;
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
        function val = growRate(this)
            val = this.growCoefficient * this.nitrateIntake;
        end
        
        % Excrete, output waste or nutrients
        function [this, tank] = output(this, tank)
        end
        
        % Grow, be harvested,  die, kill, be harvested
        function [this, tank] = behaviour(this, tank)
            % Reduced growth caused by nitrate concentration that is
            % beneath the required leve
            stuntGrowth = min(1, tank.nitrateConc() / this.minNitrateConc);
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