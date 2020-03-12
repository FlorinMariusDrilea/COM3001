% Add new fish if it is enough space in the tank
function [this, tank] = reproduce(this, tank)

    % Find free index to add fish
    index = tank.getFreeFishIndex();
    
    % Indicate that there is no space to
    % add fish or add fish if there is space
    if (index >= 0)
        tank.fish(index) = Fish(tank.newID(), this.fishParams);
    end
end