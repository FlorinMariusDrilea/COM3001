% Fish eats tank
function [thisFish, tank] = cannibalise(thisFish, tank)
    % Maximum size of target fish
    sizeLimit = thisFish.size * thisFish.cannibalSizeCoeff;

    % Filter with fish of specific size
    targetCount = 0;
    [~, n] = size(tank.fish);
    targetList = ones(n) * -1;
    for i = 1:n
        % Alive + small -> add to list
        % If a fish has a sizeCoeff bigger or equal to 1 it could 
        % eat itself in the end
        if (tank.fish(i).status == STATUS.ALIVE && tank.fish(i).size <= sizeLimit)
            targetCount = targetCount + 1;
            targetList(targetCount) = i;
        end
    end

    % If no target -> no target to eat
    if (targetCount > 0)                
        % Choose target randomly
        tIndex = ceil(targetCount * rand());

        % Eat fish at specific index
        tank.fish(targetList(tIndex)).status = STATUS.DEAD;

        % Eating makes the fish bigger
        % Adds up to nutrition as well
        thisFish.nutrition = thisFish.nutrition + ...
            tank.fish(targetList(tIndex)).size;
    end
end