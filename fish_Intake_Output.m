% File that takes intake and ouputs for the fish
function tank = fish_Intake_Output(tank)

    [~, fishPopulation] = size(tank.fish);
    % Assign randomly the fish
    % Do not let any fish to take advantages
    tank.fish = tank.fish(randperm(length(tank.fish)));

    % Intake of fish
    for j = 1:fishPopulation
        if (tank.fish(j).status == STATUS.ALIVE)
            [theFish, tank] = tank.fish(j).intake(tank);
            tank.fish(j) = theFish;
        end        
    end
    
    % Output of fish
    for j = 1:fishPopulation
        if (tank.fish(j).status == STATUS.ALIVE)
            [theFish, tank] = tank.fish(j).output(tank);
            tank.fish(j) = theFish;
        end
    end

end