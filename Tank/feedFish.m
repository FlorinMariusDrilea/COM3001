% Feeding each fish with an amount of food
function [this, fish] = feedFish(this, fish)
    % Calculations ajusted according to our research
    feedProportion = (6 / log10(fish.size + 1.5)) / 100;
    request = fish.size * feedProportion;
    
    % Taking into account  that each fish may take different amounts
    request = normrnd(request, fish.fishParams.foodIntakeStdDev);    

    % Checking the amount of food by substracting the requested amount
    if (this.fishFood - request < 0)
        % Fish can take the remaining amount
        fish.foodIntake = this.fishFood;
        % No more food available
        this.fishFood = 0; % nothing left now
    else
        % Substract from the food amount the requested value
        this.fishFood = this.fishFood - request;
        % Take the requested amount
        fish.foodIntake = request;
    end
end