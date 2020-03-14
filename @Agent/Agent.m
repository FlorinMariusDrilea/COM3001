% This class provides the framework for both 
% of the agent types in our model.
% Declare intake, output, and behaviour within 
% that interacts with the Tank

% List for both fish, plant in the same arrays
classdef (Abstract) Agent < matlab.mixin.Heterogeneous
    
    % Must be implemented
    methods (Abstract)
        intake(tank) % Age, food, ammonia
        output(tank) % Output waste/nutrients
        behaviour(tank) % Die, kill, grow, harvest
    end
    
    % Proprietes that are the same for all agents
    properties
        id
        status
        age
        size
        nutritionDecay
        nutrition
        growCoefficient % grow rate = coeff * intake
    end
    
    methods
        % Constructor of the agent + initial values        
        function agent = Agent(id, growCoefficient, ...
                startNutrition, nutritionDecay)
            agent.id = id;
            agent.status = 1;
            agent.age = 0;
            agent.size = 1;
            
            if nargin > 0
                agent.growCoefficient = growCoefficient;
                agent.nutrition = startNutrition;
                agent.nutritionDecay = nutritionDecay;
            else
                agent.growCoefficient = 0;
                agent.nutrition = 0;
                agent.nutritionDecay = 0;
                print("No arguments in Agent constructor!");
            end
        end
        % Agent age every day that pass
        function agent = ageOneDay(agent)
            agent.age = agent.age + 1;
        end
        % Agent should grow proportional to intake(food)
        function agent = grow(agent, deltaSize)
            agent.size = agent.size + deltaSize;
        end
        % Food intake adds to nutrition,
        % That decays in each step
        function agent = calcNutrition(agent, deltaFood)
            agent.nutrition = agent.nutrition ...
                + deltaFood - agent.nutritionDecay;
            if (agent.nutrition > 1)
                agent.nutrition = 1;
            end
        end
        
    end
    
end