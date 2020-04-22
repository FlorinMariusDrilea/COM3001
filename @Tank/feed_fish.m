% Feeding each fish with an amount of food
function [this, fish] = feed_fish(this, fish)
    % Calculations ajusted according to our research
    feedProportion = (6 / log10(fish.size + 1.5)) / 100;
    req = fish.size * feedProportion;
    
    % Taking into account  that each fish may take different amounts
    req = normrnd(req, fish.fishParameters.foodIntakeStdDev);    

    % Checking the amount of food by substracting the reqed amount
    if (this.fishFood - req < 0)
        % Fish can take the remaining amount
        fish.foodIntake = this.fishFood;
        % No more food available
        this.fishFood = 0; % nothing left now
    else
        % Substract from the food amount the reqed value
        this.fishFood = this.fishFood - req;
        % Take the reqed amount
        fish.foodIntake = req;
    end
end