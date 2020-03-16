% Simulation Logic:
    % Creating the environment: Tank
    % Creating the Agents
    % When iterating in the loop:
    %       tank.addFood()
    %		For all Agents:
    %			agent.intake()
    %			agent.output()
    %		bacteria.convert()
    %		For all Agents:
    %			agent.behaviour()
    % STOP

function simulation (iterations)

    % Parameters
    parameters = load_parameters();
    
    % Creating the environment
    % The tank
    tank = Tank(parameters.tankparameters, parameters.startparameters);
    bacteria = Bacteria(parameters.bacteriaparameters);
        
    % Creating the agents
    tank = create_agents(tank, parameters.tankparameters, ...
        parameters.fishparameters, parameters.plantparameters); 
    
    % The data    
    results.fishPopulation = zeros(iterations);
    results.fishSize = zeros(iterations);
    results.fishFood = zeros(iterations);
    results.fishHarvested = zeros(iterations);
    results.plantsHarvested = zeros(iterations);
    results.plantMass = zeros(iterations);
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
        
        % The fish intake and output
        tank = fish_Intake_Output(tank);
        
        % The bacteria converting ammonia level to nitrate concetration of
        % the water
        tank = bacteria.convert(tank);
        
        % The plant intake and output
        tank = plant_Intake_Output(tank);        
        
        % The behaviour
        tank = agents_behaviour(tank);
        
        % Storing the data
        results.fishPopulation(i) = tank.count_fish();
        results.fishFood(i) = tank.fishFood;
        results.fishSize(i) = tank.FishSize();
        results.fishHarvested(i) = tank.fishHarvested();
        results.plantsHarvested(i) = tank.plantsHarvested();
        results.plantMass(i) = tank.plantsMassSum();
        results.ammoniaConcentrations(i) = tank.ammoniaConc();
        results.nitrateConcentrations(i) = tank.nitrateConc();

        % Iterative displaying
        if (rem(i , parameters.displayEvery)==0 && i ~= 0)
            if (parameters.displayGraphical)
                graphics(tank, parameters.plantparameters.harvestSize, parameters.fishparameters.ammoniaThreshold)
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