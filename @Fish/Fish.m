% This class implements abstract Agent methods for the Fish type
% Intake, output, and behaviour
% Provides implementations for Fish behaviours

classdef Fish < Agent
    % Params
    properties
        fishParams
        harvestSize
        % mg/day
        excreteRate
        % In days
        reproduceAge
        reproduceProb
        % If nutrition drops from threshold propose, start canibalism
        cannibalThreshold
        % Potential targets sizes
        cannibalSizeCoeff
        % Fatal concentration of ammonia
        ammoniaThreshold 
        
        % Fields
        foodIntake 
    end
    
    methods
        % Methods
        [this, tank] = cannibalise(this, tank)
        [this, tank] = reproduce(this, tank)
        [this, tank] = harvest(this, tank)
        
        % Constructor
        function fish = Fish(id, fishParams)
            
            % Super constructor
            fish = fish@Agent(id, fishParams.growCoeff, ...
                fishParams.startNutrition, fishParams.nutritionDecay); 
            
            % Pass original params 
            fish.fishParams = fishParams;
            
            % Copying the fish params in order to modify them later
            fish.harvestSize = fishParams.harvestSize;
            fish.excreteRate = fishParams.excreteRate;
            fish.reproduceAge = fishParams.reproduceAge;
            fish.reproduceProb = fishParams.reproduceProb;
            fish.cannibalThreshold = fishParams.cannibalThreshold;
            fish.cannibalSizeCoeff = fishParams.cannibalSizeCoeff;
            
            % Threshold for fish sampled from a normal distribution
            % Used normal distribution to get 
            % a sample of the threshold for fish
            fish.ammoniaThreshold = normrnd(fishParams.ammoniaThreshold, ...
                fish.fishParams.ammoniaThreshStdDev);            
        end
        
        % Take food from tank
        function [this, tank] = intake(this, tank)
            % Age
            this.age = this.age + 1;
            
            % Repeat taking food
            [tank, this] = tank.feed_fish(this);
        end
        
        % Excrete function for the fish.
        function [this, tank] = output(this, tank)
            tank = tank.addAmmonia(this.excreteRate * this.foodIntake);
        end
    end
    
end