% Intake for fish and plants agent types
function tank = agents_behaviour(tank)

    % Initialize fish and plants
    [~, fishPop] = size(tank.fish);
    [~, plantPop] = size(tank.plants);
    
    % Behaviour of fish
    for j = 1:fishPop       
        if (tank.fish(j).status == STATUS.ALIVE)
            [theFish, tank] = tank.fish(j).behaviour(tank);
            tank.fish(j) = theFish;
        end
    end
    % Behaviour of plants
    for j = 1:plantPop
        if (tank.plants(j).status == STATUS.ALIVE)
            [thePlant, tank] = tank.plants(j).behaviour(tank);
            tank.plants(j) = thePlant;
        end
    end

end