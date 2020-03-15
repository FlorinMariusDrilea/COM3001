% Harvest a fish
function [this, fish] = harvest_fish(this, fish)
    % The status of the fish is updated to 'harvested'
    fish.status = STATUS.HARVESTED;
    % Counting the total number of harvested fish
    % Adding one for each fish
    this.fishHarvestCount = this.fishHarvestCount + 1;
    % This happens if a fish grows enough, i.e. it can be removed
    % A new fish can be added, based on the wanted reproduction 
    
end