% Simulation Logic:
    % Creating the environment: Tank
    % Creating the Agents
    % When iterating in the loop:
    %       tank.addFood()
    %		For all Agents:
    %			agent.consumption()
    %			agent.outcome()
    %		bacteria.convert()
    %		For all Agents:
    %			agent.behaviour()
    % STOP

function simulation (iterations)

    % Parameters
    parameters = load_parameters();
    
    % Creating the environment
    % The tank
    tank = Tank(parameters.tankParameters, parameters.startParameters);
    bacteria = Bacteria(parameters.bacteriaParameters);
        
    % Creating the agents
    tank = create_agents(tank, parameters.tankParameters, ...
        parameters.fishParameters, parameters.plantParameters); 
    
    % The data    
    results.fishPopulation = zeros(iterations);
    results.fishSize = zeros(iterations);
    results.fishFood = zeros(iterations);
    results.plantMass = zeros(iterations);
    results.fishHarvested = zeros(iterations);
    results.plantsHarvested = zeros(iterations);
    results.ammoniaConcentrations = zeros(iterations);
    results.nitrateConcentrations = zeros(iterations);
    
    % The graphs
    close all
    if parameters.displayGraphical
        figure('Name', 'Graphics', 'OuterPosition', [10,100, 500, 500]);
    end
    if parameters.iterativeGraphs
        figure('Name', 'Graphs', 'OuterPosition', [520, 100, 600, 1000]);
    end
    
    % Iterating over the loop            
    for i = 1:iterations
        % Adding to the tank the food amount
        tank = tank.addFood();
        
        % The fish consumption and outcome
        tank = fish_Consumption_Outcome(tank);
        
        % The bacteria converting ammonia level to nitrate concetration of
        % the water
        tank = bacteria.convert(tank);
        
        % The plant consumption and outcome
        tank = plant_Consumption_Outcome(tank);        
        
        % The behaviour
        tank = agents_behaviour(tank);
        
        % Storing the data
        results.fishPopulation(i) = tank.count_fish();
        results.fishFood(i) = tank.fishFood;
        results.fishSize(i) = tank.FishSize();
        results.fishHarvested(i) = tank.fishHarvested();
        results.plantsHarvested(i) = tank.plantsHarvested();
        results.plantMass(i) = tank.plantsMassSum();
        results.ammoniaConcentrations(i) = tank.ammoniaConcentration();
        results.nitrateConcentrations(i) = tank.nitrateConcentration();

        % Iterative displaying
        if (rem(i , parameters.displayEvery)==0 && i ~= 0)
            if (parameters.displayGraphical)
                graphics(tank, parameters.plantParameters.harvestSize, parameters.fishParameters.ammoniaThreshold)
            end
            if (parameters.iterativeGraphs)
                if (parameters.displayEvery == i)
                    plot_graphs(iterations, i, parameters.displayEvery-1, results)
                else
                    plot_graphs(iterations, i, parameters.displayEvery, results)
                end
            end
        end
    end
    
    % Constructing the figure
    if ~parameters.iterativeGraphs
        figure('Name', 'Graphs', 'OuterPosition', [520, 100, 600, 500]);
        plot_graphs(iterations, i, iterations-1, results)
    end
end