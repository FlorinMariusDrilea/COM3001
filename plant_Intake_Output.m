% File that takes intake and ouputs for the plant
function tank = plant_Intake_Output(tank)

    [~, plantPopulation] = size(tank.plants);

    % Intake of plants
    for j = 1:plantPopulation
        if (tank.plants(j).status == STATUS.ALIVE)
            [thePlant, tank] = tank.plants(j).intake(tank);
            tank.plants(j) = thePlant;
        end
    end
    
    % Output of plants
    for j = 1:plantPopulation
        if (tank.plants(j).status == STATUS.ALIVE)
            [thePlant, tank] = tank.plants(j).output(tank);
            tank.plants(j) = thePlant;
        end
    end

end