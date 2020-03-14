% Harvest a plant
function [this, plant] = harvestPlant(this, plant)    
    % The status of the plant is updated to 'harvested'
    plant.status = STATUS.HARVESTED;
    % Counting the harvested plant to the total number
    % I.e. adding one for each plant
    this.plantsHarvestCount = this.plantsHarvestCount + 1;
    % This can happen if a plant grows big enough, so it can be removed
    % As in the case of fish, based on the wanted reproduction, 
    % a new plant may be added to the tank
    
    % It will reproduce in a free found index
    index = this.getFreePlantIndex();
    
    % Check if the index has a value larger or equal to 0
    % If it is not, this is treated as a sign/error that there is no free index
    if (index >= 0)
        % Updating the index, moving the plant
        this.plants(index) = Plant(this.newID(), plant.plantParams);
    end
end