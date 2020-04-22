% Harvest or replace fish
function [this, tank] = behaviour(this, tank)
    % Grow based on growCoefficient and foodIntake
    this = grow(this, this.growCoefficient * this.foodIntake);

    % Nutrition decrease each day
    % Calculate nutrition
    this = this.calcNutrition(this.foodIntake);
    
    % Die of ammonia poisoning if concentration
    % is bigger than the chosen threshold
    if (tank.ammoniaConc() > this.ammoniaThreshold)
        this.status = STATUS.DEAD;
        return
    end

    % Die if they are starving
    if (this.nutrition <= 0)
        this.status = STATUS.DIED;
        return
    end

    % Canibalism if that is the case
    if (this.nutrition < this.cannibalThreshold)
        % Can eat only fish that are smaller 
        % than that one that is trying to eat it
        [this, tank] = this.cannibalism(tank);
    end
    
    % Reproduce only if the probability is it less than the threshold
    if (this.age >= this.reproducingAge && rand() < this.reproducingProb)
        [this, tank] = this.reproducing(tank);
    end

    % Harvest behaviour
    if (this.size >= this.harvestSize)
        [tank, this] = tank.harvest_fish(this);
    end
end