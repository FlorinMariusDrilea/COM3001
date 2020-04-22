% This class provides the framework for both 
% of the agent types in our model.
% Declare intake, output, and behaviour within 
% that interacts with the Tank

% List for both fish, plant in the same arrays
classdef (Abstract) Agent < matlab.mixin.Heterogeneous
    
    % Must be implemented
    methods (Abstract)
        % Age, food, ammonia (specific intakes of the tank)
        intake(tank)
        % Die, kill, grow, harvest (Methods of the agents described)
        behaviour(tank) 
        % Output waste/nutrients
        output(tank)
    end
    
    % Proprietes that are the same for all agents
    properties
        id
        status
        size
        age
        nutritionDecay
        nutrition
        % growing rate = coefficient * specificIntake
        growCoefficient
    end
    
    methods
        % Constructor of the agent + initial values        
        function agent = Agent(id, growCoefficient, ...
                startNutrition, nutritionDecay)
            agent.id = id;
            agent.size = 1;
            agent.status = 1;
            agent.age = 0;
            
            if nargin > 0
                agent.nutrition = startNutrition;
                agent.growCoefficient = growCoefficient;
                agent.nutritionDecay = nutritionDecay;
            % If there is no data -> print it cannot construct an agent
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