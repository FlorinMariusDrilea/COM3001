% Intake for fish and plants agent types
function tank = agents_behaviour(tank)
    
    % Initialize fish and plants
    [~, fishPopulation] = size(tank.fish);
    [~, plantPopulation] = size(tank.plants);
    
    % Behaviour of fish
    for j = 1:fishPopulation       
        if (tank.fish(j).status == STATUS.ALIVE)
            [theFish, tank] = tank.fish(j).behaviour(tank);
            tank.fish(j) = theFish;
        end
    end
    % Behaviour of plants
    for j = 1:plantPopulation
        if (tank.plants(j).status == STATUS.ALIVE)
            [thePlant, tank] = tank.plants(j).behaviour(tank);
            tank.plants(j) = thePlant;
        end
    end

end