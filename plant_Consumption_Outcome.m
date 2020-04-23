% File that takes consumption and ouputs for the plant
function tank = plant_Consumption_Outcome(tank)

    [~, plantPopulation] = size(tank.plants);

    % Consumption of plants
    for j = 1:plantPopulation
        if (tank.plants(j).status == STATUS.ALIVE)
            [thePlant, tank] = tank.plants(j).consumption(tank);
            tank.plants(j) = thePlant;
        end
    end
    
    % Outcome of plants
    for j = 1:plantPopulation
        if (tank.plants(j).status == STATUS.ALIVE)
            [thePlant, tank] = tank.plants(j).outcome(tank);
            tank.plants(j) = thePlant;
        end
    end

end