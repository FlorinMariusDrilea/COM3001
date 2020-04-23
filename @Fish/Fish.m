% This class implements abstract Agent methods for the Fish type
% Intake, output, and behaviour
% Provides implementations for Fish behaviours

classdef Fish < Agent
    % Parameters
    properties
        fishParameters
        harvestSize
        excreteRate
        % In days
        reproducingAge
        reproducingLikelihood
        % If nutrition drops from threshold propose, start canibalism
        cannibalismThreshold
        % Potential targets sizes
        cannibalismSizeCoefficient
        % Fatal concentration of ammonia
        ammoniaThreshold 
        
        % Fields
        foodValue 
    end
    
    methods
        % Methods
        [this, tank] = reproducing(this, tank)
        [this, tank] = cannibalism(this, tank)
        [this, tank] = harvest(this, tank)
        
        % Constructor
        function fish = Fish(id, fishParameters)
            
            % Super constructor
            fish = fish@Agent(id, fishParameters.growCoefficient, ...
                fishParameters.startNutrition, fishParameters.nutritionDecay); 
            
            % Pass original parameters 
            fish.fishParameters = fishParameters;
            
            % Copying the fish parameters in order to modify them later
            fish.harvestSize = fishParameters.harvestSize;
            fish.excreteRate = fishParameters.excreteRate;
            fish.reproducingLikelihood = fishParameters.reproducingLikelihood;
            fish.reproducingAge = fishParameters.reproducingAge;
            fish.cannibalismThreshold = fishParameters.cannibalismThreshold;
            fish.cannibalismSizeCoefficient = fishParameters.cannibalismSizeCoefficient;
            
            % Threshold for fish sampled from a normal distribution
            % Used normal distribution to get 
            % a sample of the threshold for fish
            fish.ammoniaThreshold = normrnd(fishParameters.ammoniaThreshold, ...
                fish.fishParameters.ammoniaThreshStdDev);            
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
            tank = tank.addAmmonia(this.excreteRate * this.foodValue);
        end
    end
    
end