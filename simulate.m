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

function simulate (iterations)

    % Parameters
    params = load_parameters();
    
    % Creating the environment
    % The tank
    tank = Tank(params.tankParams, params.startParams);
    % The bacteria
    bacteria = Bacteria(params.bacteriaParams);
    
    % Creating the agents
    tank = create_agents(tank, params.tankParams, ...
        params.fishParams, params.plantParams);
    
    
    % The data    
    results.fishPop = zeros(iterations);
    results.fishSize = zeros(iterations);
    results.fishFood = zeros(iterations);
    results.fishHarvested = zeros(iterations);
    results.plantsHarvested = zeros(iterations);
    results.plantMass = zeros(iterations);
    results.ammoniaConcs = zeros(iterations);
    results.nitrateConcs = zeros(iterations);
    
    % The graphs
    close all
    if params.displayGraphical
        figure('Name', 'Graphics', 'OuterPosition', [10,100, 500, 500]);
    end
    if params.iterativeGraphs
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
        results.fishPop(i) = tank.countAliveFish();
        results.fishFood(i) = tank.fishFood;
        results.fishSize(i) = tank.FishSize();
        results.fishHarvested(i) = tank.fishHarvested();
        results.plantsHarvested(i) = tank.plantsHarvested();
        results.plantMass(i) = tank.plantsMassSum();
        results.ammoniaConcs(i) = tank.ammoniaConc();
        results.nitrateConcs(i) = tank.nitrateConc();

        % Iterative displaying
        if (rem(i , params.displayEvery)==0 && i ~= 0)
            if (params.displayGraphical)
                graphics(tank, params.plantParams.harvestSize, params.fishParams.ammoniaThreshold)
            end
            if (params.iterativeGraphs)
                if (params.displayEvery == i)
                    plot_graphs(results, i, iterations, params.displayEvery-1)
                else
                    plot_graphs(results, i, iterations, params.displayEvery)
                end
            end
        end
    end
    
    % Constructing the figure
    if ~params.iterativeGraphs
        figure('Name', 'Graphs', 'OuterPosition', [520, 100, 600, 1000]);
        plot_graphs(results,i, iterations, iterations-1)
    end
end