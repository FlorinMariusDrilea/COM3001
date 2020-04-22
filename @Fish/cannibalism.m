% Fish eats tank
function [thisFish, tank] = cannibalism(thisFish, tank)
    % Maximum size of target fish
    sizeLimit = thisFish.size * thisFish.cannibalSizeCoefficient;

    % Filter with fish of specific size
    targetCounter = 0;
    [~, n] = size(tank.fish);
    targetList = ones(n) * -1;
    for i = 1:n
        % Alive + small -> add to list
        % If a fish has a sizeCoefficient bigger or equal to 1 it could 
        % eat itself in the end
        if (tank.fish(i).status == STATUS.ALIVE && tank.fish(i).size <= sizeLimit)
            targetCounter = targetCounter + 1;
            targetList(targetCounter) = i;
        end
    end

    % If no target -> no target to eat
    if (targetCounter > 0)                
        % Choose target randomly
        tIndex = ceil(targetCounter * rand());

        % Eat fish at specific index
        tank.fish(targetList(tIndex)).status = STATUS.DIED;

        % Eating makes the fish bigger
        % Adds up to nutrition as well
        thisFish.nutrition = thisFish.nutrition + ...
            tank.fish(targetList(tIndex)).size;
    end
end